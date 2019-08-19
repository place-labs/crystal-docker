require "json"
require "./models/container"
require "./models/create_container_response"
require "./models/container_summary"
require "./models/wait_response"

module Docker::Api::Containers
  # List containers. Similar to the docker ps command.
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

  def create_container(name : String? = nil, **props)
    params = HTTP::Params.build do |param|
      param.add "name", name unless name.nil?
    end
    response = post "/containers/create?#{params}", body: props.camelcase_keys.to_json
    Models::CreateContainerResponse.from_json response.body
  end

  # Identical to the docker inspect command, but only for containers.
  def inspect_container(id : String)
    response = get "/containers/#{id}/json"
    Models::Container.from_json response.body
  end

  def start(id : String)
    post "/containers/#{id}/start"
    self
  end

  def stop(id : String, timeout : Int? = nil)
    params = HTTP::Params.build do |param|
      param.add "timeout", timeout unless timeout.nil?
    end
    post "/containers/#{id}/stop?#{params}"
    self
  end

  def restart(id : String, timeout : Int? = nil)
    params = HTTP::Params.build do |param|
      param.add "timeout", timeout unless timeout.nil?
    end
    post "/containers/#{id}/restart?#{params}"
    self
  end

  # Send a POSIX signal to a container, defaulting to killing to the container.
  def kill(id : String, signal : String? = nil)
    params = HTTP::Params.build do |param|
      param.add "signal", signal unless signal.nil?
    end
    post "/containers/#{id}/kill?#{params}"
    self
  end

  # Change various configuration options of a container without having to recreate it.
  def update(id : String, **props)
    post "/containers/#{id}/update", body: props.camelcase_keys.to_json
    self
  end

  def rename(id : String, name : String)
    params = HTTP::Params.build do |param|
      param.add "name", name
    end
    post "/containers/#{id}/rename?#{params}"
    self
  end

  # Use the cgroups freezer to suspend all processes in a container.
  #
  # Traditionally, when suspending a process the `SIGSTOP` signal is used, which is observable by the
  # process being suspended. With the cgroups freezer the process is unaware, and unable to capture,
  # that it is being suspended, and subsequently resumed.
  def pause(id : String)
    post "/containers/#{id}/pause"
    self
  end

  # Resume a container which has been paused.
  def unpause(id : String)
    post "/containers/#{id}/unpause"
    self
  end

  # Block until a container stops, then returns the exit code.
  def wait(id : String, condition : String? = nil)
    params = HTTP::Params.build do |param|
      param.add "condition", condition unless condition.nil?
    end
    response = post "/containers/#{id}/wait?#{params}"
    Models::WaitResponse.from_json response.body
  end

  def remove_container(id : String, v : Bool? = nil, force : Bool? = nil, link : Bool? = nil)
    params = HTTP::Params.build do |param|
      param.add "v", v unless v.nil?
      param.add "force", force unless force.nil?
      param.add "link", link unless link.nil?
    end
    delete "/containers/#{id}?#{params}"
    self
  end
end
