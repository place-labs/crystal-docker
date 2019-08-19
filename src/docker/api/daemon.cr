require "./models/version"

# API queries for interaction with the underlying Docker daemon.
module Docker::Api::Daemon
  # Checks connectivity with the underlying API.
  #
  # Returns `true` if everything is playing nicely, or raises a `Docker::ApiError`.
  def ping
    get("/_ping").body == "OK"
  end

  # Returns version information from the server.
  #
  # Similar to the `docker version` command.
  def version
    response = get "/version"
    Models::Version.from_json(response.body)
  end
end
