require "./api_client_wrapper"
require "./api/models/container"

# Interact with a single container that exists on a docker client.
class Docker::Container
  include Docker::ApiClientWrapper

  # Locally cached container attributes.
  #
  # This is populated at the time of object creation. Use '#reload!' to update.
  getter attrs : Docker::Api::Models::Container

  # Create a new container interaction object for the passed container *id*.
  def initialize(@client, id : String)
    @attrs = client.inspect_container id
  end

  # Create a new container interaction object based on a previous queried container model.
  def initialize(@client, @attrs)
  end

  # The ID of the container object.
  def id
    attrs.id
  end

  # The image ID of the container.
  def image
    attrs.image
  end

  # The labels of a container.
  def labels
    attrs.config.labels
  end

  # The name of the container.
  def name
    attrs.name
  end

  # The ID of the object, truncated to 10 characters.
  def short_id
    id[0, 10]
  end

  # The status of the container. For example, "running", or "exited".
  def status
    attrs.state.status
  end

  # Start this container.
  def start
    client.start id
    self
  end

  # Stop this container.
  def stop(timeout = nil)
    client.stop id, timeout
    self
  end

  # Kill or send a signal to the container.
  def kill(signal = nil)
    client.kill id, signal
    self
  end

  # Update resource configuration of the containers.
  def update(**props)
    client.update id, **props
    self
  end

  # Load this object from the server again and update attrs with the new data.
  def reload!
    @attrs = client.inspect_container id
  end

  # Remove this container.
  #
  # Similar to the `docker rm` command.
  def remove(v = nil, force = nil, link = nil)
    client.remove_container id, v, force, link
    nil
  end

  # Rename this container.
  #
  # Similar to the `docker rename` command.
  def rename(name : String)
    client.rename id, name
    self
  end

  # Restart this container.
  #
  # Similar to the `docker restart` command.
  def restart(timeout = nil)
    client.restart id, timeout
    self
  end

  # Pauses all processes within this container.
  def pause
    client.pause id
    self
  end

  # Unpause all processes within the container.
  def unpause
    client.unpause id
    self
  end

  # Block until the container stops, then return its exit code.
  def wait(condition = nil)
    response = client.wait id, condition
    response.status_code
  end
end
