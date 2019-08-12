module Docker::Api::Daemon
  # Checks connectivity with the underlying API.
  #
  # Returns `true` if everything is playing nicely, or raises a Docker::ClientError.
  def ping
    get("/_ping").body == "OK"
  end
end
