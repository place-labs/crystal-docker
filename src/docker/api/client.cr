require "uri"
require "http/client"
require "json"
require "../../core_ext/http/client"
require "../../core_ext/openssl/**"
require "../errors"
require "./daemon"

# Low-level wrapper for the Docker Engine API.
class Docker::Api::Client
  DEFAULT_URL = "unix:///var/run/docker.sock"

  private getter client : HTTP::Client

  # API version in use, defaults to latest if `nil`
  getter version : String?

  def initialize(base_url = DEFAULT_URL, @version = nil)
    uri = URI.parse base_url

    case uri.scheme
    when "unix"
      @client = HTTP::Client.unix base_url.to_s.sub(/^unix:\/\//, "")
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
      path = "/#{version}#{path}" unless version.nil?
      response = client.{{method.id}} path, headers, body
      raise Docker::ApiError.from_response(response) unless response.success?
      response
    end
  {% end %}

  include Daemon
end
