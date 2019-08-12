require "./api/client"

# User friendly client for type-safe interaction with the Docker Engine API.
class Docker::Client
  private getter client : Docker::Api::Client

  # Creats a new instance for a pre-establish low-level client.
  def initialize(@client)
  end

  # Creates a new instance for the passed *base_url*
  def initialize(base_url = Docker::Api::Client::DEFAULT_URL)
    @client = Docker::Api::Client.new base_url
  end
end
