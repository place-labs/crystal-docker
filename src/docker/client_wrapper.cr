require "./api/client"

# Mixin for building objects that wrap sections of the API.
module Docker::ClientWrapper
  private getter client : Docker::Api::Client

  # Creats a new instance for a pre-establish low-level client.
  def initialize(@client)
  end
end
