require "./docker/client"

module Docker
  extend self

  # Creates a docker client instance based on setting from env vars.
  def from_env
    client ENV["DOCKER_HOST"]
  end

  # Creats a new docker client for the local docker socket.
  def client
    Docker::Client.new
  end

  # Creates a new docker client instance for *base_url*.
  def client(base_url : String)
    Docker::Client.new base_url
  end

  # Creates a new low-level docker API wrapper the local docker socket.
  def api_client
    Docker::Api::ApiClient.new
  end

  # Creates a new low-level docker API wrapper for *base_url*
  def api_client(base_url)
    Docker::Api::ApiClient.new base_url
  end
end
