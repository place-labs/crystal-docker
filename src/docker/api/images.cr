require "../../tools"
require "./models/build_info"
require "./models/image"

# API queries for image interaction.
module Docker::Api::Images
  # Builds an image.
  #
  # Contents of *path* will be compressed and forwarded to the underlying docker instance by this
  # process, allowing for building on remote hosts or environments the docker daemon does not have
  # direct read access to the target.
  #
  # Yields an iterator of `BuildInfo` objects that will contain updates from the daemon as the
  # image build progresses.
  def build(path : String, **opts)
    params = HTTP::Params.encode opts

    headers = HTTP::Headers.new
    headers["Content-Type"] = "application/x-tar"

    post "/build?#{params}", headers: headers, body: Tools.tar path do |response|
      yield response.body_io.each_line.map(&->Models::BuildInfo.from_json(String))
    end
  end
end
