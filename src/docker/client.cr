require "./client_wrapper"

# User friendly client for type-safe interaction with the Docker Engine API.
class Docker::Client
  include Docker::ClientWrapper

  # Creates a new instance for the passed *base_url*
  def initialize(base_url = Docker::Api::Client::DEFAULT_URL)
    @client = Docker::Api::Client.new base_url
  end

  # Provide scoped methods for container interaction.
  def containers
    @containers ||= Containers.new client
  end
end
