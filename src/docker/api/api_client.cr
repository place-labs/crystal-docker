require "uri"
require "http/client"
require "json"
require "../../core_ext/http/client"
require "../../core_ext/openssl/**"
require "../../core_ext/named_tuple/camelcase_keys"
require "../errors"
require "./containers"
require "./daemon"
require "./images"

# Low-level wrapper for the Docker Engine API.
#
# Each method on maps one-to-one with a REST API endpoint, and either returns the response that the
# API responds with or raises an `Docker::ApiError`. It's possible to use `ApiClient` directly if
# you require the extra flexibility, however in most cases the abstractions provided by the
# higher-level `Docker::Client` may be the better choice.
class Docker::Api::ApiClient
  DEFAULT_URL = "unix:///var/run/docker.sock"

  # :no_doc:
  # Underlying HTTP connection - exposed for access from test framework only.
  getter connection : HTTP::Client

  # API version in use, defaults to latest if `nil`
  getter api_version : String?

  def initialize(base_url = DEFAULT_URL, @api_version = nil)
    uri = URI.parse base_url

    case uri.scheme
    when "unix"
      @connection = HTTP::Client.unix base_url.to_s.sub(/^unix:\/\//, "")
    else
      raise NotImplementedError.new("local unix socket only supported at the time")
    end
  end

  {% for method in %w(get post put head delete patch options) %}
    # Executes a {{method.id.upcase}} request on the docker client connection.
    #
    # The response status will be automatically checked and a Docker::ApiError raised if
    # unsuccessful.
    # ```
    def {{method.id}}(path, headers : HTTP::Headers? = nil, body : HTTP::Client::BodyType? = nil)
      path = "/#{api_version}#{path}" unless api_version.nil?
      response = connection.{{method.id}} path, headers, body
      raise Docker::ApiError.from_response(response) unless response.success?
      response
    end

    # Executes a {{method.id.upcase}} request on the docker client connection with a JSON body
    # formed from the passed `NamedTuple`.
    def {{method.id}}(path, body : NamedTuple)
      headers = HTTP::Headers.new
      headers["Content-Type"] = "application/json"
      {{method.id}} path, headers, body.camelcase_keys.to_json
    end

    # :ditto:
    def {{method.id}}(path, headers : HTTP::Headers, body : NamedTuple)
      headers["Content-Type"] = "application/json"
      {{method.id}} path, headers, body.camelcase_keys.to_json
    end

    # Executes a {{method.id.upcase}} request and yields the response to the block.
    # The response will have its body as an `IO` accessed via `HTTP::Client::Response#body_io`.
    #
    # The response status will be automatically checked and a Docker::ApiError raised if
    # unsuccessful.
    def {{method.id}}(path, headers : HTTP::Headers? = nil, body : HTTP::Client::BodyType = nil)
      connection.{{method.id}} path, headers, body do |response|
        raise Docker::ApiError.from_response(response) unless response.success?
        yield response
      end
    end

    # Executes a {{method.id.upcase}} request on the docker client connection with a JSON body
    # formed from the passed `NamedTuple`  and yields the response to the block.
    def {{method.id}}(path, body : NamedTuple)
      headers = HTTP::Headers.new
      headers["Content-Type"] = "application/json"
      {{method.id}} path, headers, body.camelcase_keys.to_json do |response|
        yield response
      end
    end

    # :ditto:
    def {{method.id}}(path, headers : HTTP::Headers, body : NamedTuple)
      headers["Content-Type"] = "application/json"
      {{method.id}} path, headers, body.camelcase_keys.to_json do |response|
        yield response
      end
    end
  {% end %}

  include Containers
  include Daemon
  include Images
end
