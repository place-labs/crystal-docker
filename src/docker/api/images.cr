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
  # Returns an iterator of `Models::BuildInfo` objects with the build output.
  def build(path : String, **opts)
    params = HTTP::Params.encode opts

    headers = HTTP::Headers.new
    headers["Content-Type"] = "application/x-tar"

    channel = Channel(Iterator(Models::BuildInfo)).new

    spawn do
      post "/build?#{params}", headers: headers, body: Tools.tar path do |response|
        # Responses are returned as JSON-lines in a streamed response body
        line_iter  = response.body_io.each_line
        build_info = line_iter.map &->Models::BuildInfo.from_json(String)
        channel.send build_info
      end
    end

    # FIXME: this is creation infinite recursion in the compiler - need to put a workaround in
    # place that doesn't pass the iterator to the channel.
    # see: https://github.com/crystal-lang/crystal/issues/8150
    channel.receive
  end
end
