require "./api_client_wrapper"

# Create and manage images on the attached docker instance.
class Docker::Images
  include Docker::ApiClientWrapper

  # Build an image and return it.
  #
  # Similar to the `docker build` command.
  def build(path = String, **props)
    client.build path, **props do |build_info|
      # NOTE: despite the API docs specifying an object with seperate fields for error, progress
      # etc, all info appears to come back with the stream atribute. To keep things clean, only
      # this is extracted at this point.
      build_info.each { |update| yield update.stream }
    end
    # TODO: await response and parse to an image object
  end
end
