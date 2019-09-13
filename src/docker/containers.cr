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
  def create(image : String, **props)
    response = client.create_container **props.merge image: image
    Container.new client, response.id
  end

  # List containers. Similar to the docker ps command.
  #
  # Available `filters`, filter value may be a single value or an array:
  # - exited : Int32     Only containers with specified exit code
  # - status : String    One of "restarting", "running", "paused", "exited"
  # - label : String     Format either "key" or "key=value"
  # - id : String        Container ID
  # - name : String      Container name
  # - ancestor : String  String Filter by container ancestor. <image-name>[:tag], <image-id>, <image@digest>.
  # - before : String    String Only containers created before a particular container. Container name or ID.
  # - since : String     Only containers created after a particular container. Container name or ID.
  def list(all : Bool? = nil, limit : Int? = nil, size : Bool? = nil, filters : Hash? = nil) : Array(Container)
    container_ids = client.containers(all, limit, size, filters).map &.id
    container_ids.map &->get(String)
  end

  # Get a container by name or ID.
  def get(id_or_name)
    container = client.inspect_container id_or_name
    Container.new client, container
  end
end
