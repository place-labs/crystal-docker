require "./api_client_wrapper"
require "./errors"
require "./image"

# Create and manage images on the attached docker instance.
class Docker::Images
  include Docker::ApiClientWrapper

  # Build an image and return it.
  #
  # Similar to the `docker build` command.
  def build(path : String, **props) : Image
    updates = client.build path, **props

    # NOTE: despite the API docs specifying an object with seperate fields for error, progress etc,
    # all info appears to come back with the stream atribute. To keep things clean, extract this
    # attribute as a stand-alone string.

    # Capture build output
    build_output = [] of String
    # Capture image id from build output
    image_id = nil

    updates.each do |update|
      chunk = update.stream
      error = update.error

      build_output << chunk if chunk

      raise BuildError.new(build_output, error) if error

      if chunk
        if (match = chunk.match(/(^Successfully built |sha256:)([0-9a-f]+)$/))
          # Extract image id from output of success build
          image_id = match[2]
        end

        yield chunk
      end
    end

    raise BuildError.new(build_output) unless image_id

    get(image_id)
  end

  # Get a image by name or ID.
  def get(id_or_name : String)
    Image.new client, id_or_name
  end

  # List images. Similar to the docker ps command.
  #
  # Available `filters`, filter value may be a single value or an array:
  # - dangling : Bool    Only dangling images
  # - label : String     Only images with label(s)
  def list(all : Bool? = nil, name : String? = nil, filters : Hash? = nil) : Array(Image)
    image_ids = client.images(all, name, filters).map &.id
    image_ids.map &->get(String)
  end
end
