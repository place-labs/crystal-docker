require "json"
require "./models/container"
require "./models/create_container_response"
require "./models/container_summary"
require "./models/wait_response"

# API queries for container interaction.
module Docker::Api::Containers
  # List containers.
  #
  # Similar to the `docker ps` command.
  def containers(all : Bool? = nil, limit : Int? = nil, size : Bool? = nil, filters : String? = nil)
    params = HTTP::Params.build do |param|
      param.add "all", all.to_s unless all.nil?
      param.add "limit", limit.to_s unless limit.nil?
      param.add "size", size.to_s unless size.nil?
      param.add "filters", filters.to_s unless filters.nil?
    end
    response = get "/containers/json?#{params}"
    Array(Models::ContainerSummary).from_json response.body
  end

  # Creates a container.
  #
  # Parameters are similar to those for the `docker run` command.
  def create_container(name : String? = nil, **props)
    params = HTTP::Params.build do |param|
      param.add "name", name unless name.nil?
    end
    response = post "/containers/create?#{params}", body: props
    Models::CreateContainerResponse.from_json response.body
  end

  # Query container info.
  #
  # Identical to the `docker inspect` command, but only for containers.
  def inspect_container(id : String)
    response = get "/containers/#{id}/json"
    Models::Container.from_json response.body
  end

  # Start a container.
  #
  # Similar to the `docker start` command, but doesn’t support attach options.
  def start(id : String)
    post "/containers/#{id}/start"
    nil
  end

  # Stops a container.
  #
  # Similar to the `docker stop` command.
  def stop(id : String, timeout : Int? = nil)
    params = HTTP::Params.build do |param|
      param.add "timeout", timeout unless timeout.nil?
    end
    post "/containers/#{id}/stop?#{params}"
    nil
  end

  # Restart a container.
  #
  # Similar to the `docker restart` command.
  def restart(id : String, timeout : Int? = nil)
    params = HTTP::Params.build do |param|
      param.add "timeout", timeout unless timeout.nil?
    end
    post "/containers/#{id}/restart?#{params}"
    nil
  end

  # Send a POSIX signal to a container, defaulting to killing to the container.
  #
  # Similar to the `docker kill` command.
  def kill(id : String, signal : String? = nil)
    params = HTTP::Params.build do |param|
      param.add "signal", signal unless signal.nil?
    end
    post "/containers/#{id}/kill?#{params}"
    nil
  end

  # Change various configuration options of a container without having to recreate it.
  #
  # Similar to `docker update` command.
  def update(id : String, **props)
    post "/containers/#{id}/update", body: props
    nil
  end

  # Rename a container.
  #
  # Similar to the `docker rename` command.
  def rename(id : String, name : String)
    params = HTTP::Params.build do |param|
      param.add "name", name
    end
    post "/containers/#{id}/rename?#{params}"
    nil
  end

  # Pauses all processes within a container.
  #
  # Similar to `docker pause` command.
  def pause(id : String)
    post "/containers/#{id}/pause"
    nil
  end

  # Resume a container which has been paused.
  #
  # Similar to `docker unpause` command.
  def unpause(id : String)
    post "/containers/#{id}/unpause"
    nil
  end

  # Block until a container stops, then returns the exit code.
  #
  # Similar to `docker wait` command.
  def wait(id : String, condition : String? = nil)
    params = HTTP::Params.build do |param|
      param.add "condition", condition unless condition.nil?
    end
    response = post "/containers/#{id}/wait?#{params}"
    Models::WaitResponse.from_json response.body
  end

  # Remove a container.
  #
  # Similar to the `docker rm` command.
  def remove_container(id : String, v : Bool? = nil, force : Bool? = nil, link : Bool? = nil)
    params = HTTP::Params.build do |param|
      param.add "v", v unless v.nil?
      param.add "force", force unless force.nil?
      param.add "link", link unless link.nil?
    end
    delete "/containers/#{id}?#{params}"
    nil
  end
end
