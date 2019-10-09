require "../../tools"
require "./models/build_info"
require "./models/image"
require "./models/image_summary"

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

    # OPTIMIZE: current version of the crystal compiler (0.30.0) do not support passing Iterators
    # across a channel. When this is corrected, the IO within the response block and pre-parsed
    # BuildInfo provided directly as an iterator. Implementation below.
    # See: https://github.com/crystal-lang/crystal/issues/8150
    #
    # channel = Channel(Iterator(Models::BuildInfo)).new
    # post "/build?#{params}", headers: headers, body: Tools.tar path do |response|
    #   # Responses are returned as JSON-lines in a streamed response body
    #   line_iter  = response.body_io.each_line
    #   build_info = line_iter.map &->Models::BuildInfo.from_json(String)
    #   channel.send build_info
    # end
    # channel.receive

    # Responses are returned as JSON-lines in a streamed response body. Block until headers are
    # received, then continue with a body IO.
    channel = Channel(IO).new
    spawn do
      post "/build?#{params}", headers: headers, body: Tools.tar path do |response|
        channel.send response.body_io
      end
    end
    body_io = channel.receive

    body_io.each_line.map &->Models::BuildInfo.from_json(String)
  end

  # List images.
  #
  # Similar to the `docker ps` command.
  def images(all : Bool? = nil, name : String? = nil, filters : Hash? = nil)
    transformed_filters = filters.try &.transform_values { |v| v.is_a?(Array) ? v : [v] }
    params = HTTP::Params.build do |param|
      param.add "all", all.to_s unless all.nil?
      param.add "name", name.to_s unless name.nil?
      param.add "filters", transformed_filters.to_json unless transformed_filters.nil?
    end
    response = get "/images/json?#{params}"
    Array(Models::ImageSummary).from_json response.body
  end

  # Query image info.
  #
  # Identical to the `docker inspect` command, but only for image.
  def inspect_image(id : String)
    response = get "/images/#{id}/json"
    Models::Image.from_json response.body
  end
end
