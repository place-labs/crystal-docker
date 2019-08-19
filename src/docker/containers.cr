require "./api_client_wrapper"
require "./container"

# Run and manage containers on the attached docker instance.
class Docker::Containers
  include Docker::ApiClientWrapper

  # Create a container without starting it.
  #
  # Similar to `docker create`.
  #
  # Returns a `Docker::Container` that may be used to start, inspect or otherwise interact with the
  # created container.
  def create(image = String, **props)
    container = client.create_container **props.merge image: image
    Container.new client, container.id
  end

  # Get a container by name or ID.
  def get(id_or_name)
    container = client.inspect_container id_or_name
    Container.new client, container.id
  end
end
