require "./docker/client"

module Docker
  extend self

  # Creates a docker client instance based on setting from env vars.
  def from_env
    Docker::Client.new ENV["DOCKER_HOST"]
  end

  # Creates a new docker client instance
  def client(*kwargs)
    Docker::Client.new *kwargs
  end

  # Creates a new low-level docker API wrapper
  def api_client(*kwargs)
    Docker::Api::Client.new *kwargs
  end
end
