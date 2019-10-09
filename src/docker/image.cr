require "./api_client_wrapper"
require "./api/models/image"

# Interact with a single image that exists on a docker client.
class Docker::Image
  include Docker::ApiClientWrapper

  # Locally cached image attributes.
  #
  # This is populated at the time of object creation. Use '#reload!' to update.
  getter attrs : Docker::Api::Models::Image

  # Create a new image interaction object for the passed image *id*.
  def initialize(@client, id : String)
    @attrs = client.inspect_image id
  end

  # Create a new image interaction object based on a previous queried image model.
  def initialize(@client, @attrs)
  end

  # The ID of the image object.
  def id
    attrs.id
  end

  # The labels of a image.
  def labels
    attrs.config.labels
  end

  # The ID of the image truncated to 10 characters, plus the "sha256:" prefix.
  def short_id
    if id.starts_with? "sha256:"
      id[0, 17]
    else
      id[0, 10]
    end
  end

  # The image's tags.
  def tags
    attrs.repo_tags.try &.reject("<none>:<none>") || [] of String
  end

  # Load this object from the server again and update attrs with the new data.
  def reload!
    @attrs = client.inspect_image id
  end
end
