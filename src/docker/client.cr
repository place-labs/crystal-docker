require "./api_client_wrapper"

# User friendly client for type-safe interaction with the Docker Engine API.
class Docker::Client
  include Docker::ApiClientWrapper

  # Creates a new instance for the passed *base_url*
  def initialize(base_url = Docker::Api::ApiClient::DEFAULT_URL)
    @client = Docker::Api::ApiClient.new base_url
  end

  # Provide scoped methods for container interaction.
  def containers
    @containers ||= Containers.new client
  end
end
