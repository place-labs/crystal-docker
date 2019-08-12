module Docker::Api::Daemon
  def ping
    get("/_ping").body == "OK"
  end
end
