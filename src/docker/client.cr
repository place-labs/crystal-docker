require "./api_client_wrapper"
require "./containers"

# A client for communicating with a Docker server.
#
# Provides the main entrypoint for common interaction with a docker instance.
class Docker::Client
  include Docker::ApiClientWrapper

  # Creates a new instance for the passed *base_url*
  def initialize(base_url = Docker::Api::ApiClient::DEFAULT_URL)
    @client = Docker::Api::ApiClient.new base_url
  end

  # Provide an object for managing containers. See `Docker::Containers`.
  def containers : Containers
    @containers ||= Containers.new client
  end
end
