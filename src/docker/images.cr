require "./api_client_wrapper"

# Create and manage images on the attached docker instance.
class Docker::Images
  include Docker::ApiClientWrapper

  # Build an image and return it.
  #
  # Similar to the `docker build` command.
  def build(path = String, **props)
    response = client.build path, **props
  end
end
