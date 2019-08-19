require "./api/api_client"

# Mixin for building objects that wrap sections of the API.
module Docker::ApiClientWrapper
  private getter client : Docker::Api::ApiClient

  # Creats a new instance for a pre-establish low-level client.
  def initialize(@client)
  end
end
