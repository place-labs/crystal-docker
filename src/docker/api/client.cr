require "uri"
require "http/client"
require "../../core_ext/http/client"
require "../../core_ext/openssl/**"
require "./daemon"

# Low-level wrapper for the Docker Engine API.
class Docker::Api::Client
  DEFAULT_URL = "unix:///var/run/docker.sock"

  private getter client : HTTP::Client

  private delegate get, post, put, patch, head, delete, to: client

  def initialize(base_url = DEFAULT_URL)
    uri = URI.parse base_url

    case uri.scheme
    when "unix"
      @client = HTTP::Client.unix base_url.to_s.sub(/^unix:\/\//, "")
    else
      raise NotImplementedError.new("local unix socket only supported at the time")
    end
  end

  include Daemon
end
