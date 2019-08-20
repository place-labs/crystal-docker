require "../../tools"

# API queries for image interaction.
module Docker::Api::Images
  # Builds an image.
  #
  # Contents of *path* will be compressed and forwarded to the underlying docker instance by this
  # process, allowing for building on remote hosts or environments the docker daemon does not have
  # direct read access to the target.
  def build(path : String, **opts)
    params = HTTP::Params.encode opts

    headers = HTTP::Headers.new
    headers["Content-Type"] = "application/x-tar"

    post "/build?#{params}", headers: headers, body: Tools.tar path
  end
end
