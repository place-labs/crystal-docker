require "./api_client_wrapper"

# Create and manage images on the attached docker instance.
class Docker::Images
  include Docker::ApiClientWrapper

  # Build an image and return it.
  #
  # Similar to the `docker build` command.
  def build(path : String, **props)
    updates = client.build path, **props

    # NOTE: despite the API docs specifying an object with seperate fields for error, progress etc,
    # all info appears to come back with the stream atribute. To keep things clean, extract this
    # attribute as a stand-alone string.
    updates.each { |update| yield update.stream }

    # TODO: await response and parse to an image object
  end
end
