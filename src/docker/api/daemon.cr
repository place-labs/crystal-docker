require "./models/version"

module Docker::Api::Daemon
  # Checks connectivity with the underlying API.
  #
  # Returns `true` if everything is playing nicely, or raises a `Docker::ApiError`.
  def ping
    get("/_ping").body == "OK"
  end

  def version
    response = get "/version"
    Models::Version.from_json(response.body)
  end
end
