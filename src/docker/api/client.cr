require "uri"
require "http/client"
require "json"
require "../../core_ext/http/client"
require "../../core_ext/openssl/**"
require "../client_error"
require "./models/*"
require "./daemon"

# Low-level wrapper for the Docker Engine API.
class Docker::Api::Client
  DEFAULT_URL = "unix:///var/run/docker.sock"

  private getter client : HTTP::Client

  def initialize(base_url = DEFAULT_URL)
    uri = URI.parse base_url

    case uri.scheme
    when "unix"
      @client = HTTP::Client.unix base_url.to_s.sub(/^unix:\/\//, "")
    else
      raise NotImplementedError.new("local unix socket only supported at the time")
    end
  end

  {% for method in %w(get post put head delete patch options) %}
    # Executes a {{method.id.upcase}} request.
    #
    # The response status will be automatically checked, and a Docker::ClientError raised if the
    # request is unsuccessful.
    # ```
    def {{method.id}}(path, headers : HTTP::Headers? = nil, body : HTTP::Client::BodyType? = nil)
      response = client.{{method.id}} path, headers, body

      unless response.success?
        error = Models::Error.from_json response.body
        raise Docker::ClientError.new error.message
      end

      response
    end
  {% end %}

  include Daemon
end
