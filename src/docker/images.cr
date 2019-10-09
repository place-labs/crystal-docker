require "./api_client_wrapper"
require "./image"

# Create and manage images on the attached docker instance.
class Docker::Images
  include Docker::ApiClientWrapper

  # Build an image and return it.
  #
  # Similar to the `docker build` command.
  def build(path : String, **props) : Image?
    updates = client.build path, **props

    image_id = nil
    updates = updates.tap do |update|
      if (match = update.stream.try &.match(/(^Successfully built |sha256:)([0-9a-f]+)$/))
        # Capture the image id from build output
        image_id = match[2]
      end
    end

    updates.each { |update| yield update.stream }

    get(image_id.as(String)) if image_id
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
