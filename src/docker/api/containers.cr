require "json"
require "./models/container"
require "./models/container_summary"

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

  struct CreateContainerResponse
    JSON.mapping({
      id:       {setter: false, key: "Id", type: String},
      warnings: {setter: false, key: "Warnings", type: Array(String)},
    })
  end

  def create_container(name : String? = nil, **props)
    params = HTTP::Params.build do |param|
      param.add "name", name unless name.nil?
    end
    response = post "/containers/create?#{params}", body: props.camelcase_keys.to_json
    CreateContainerResponse.from_json response.body
  end

  # Identical to the docker inspect command, but only for containers.
  def inspect_container(id : String)
    response = get "/containers/#{id}/json"
    Models::Container.from_json response.body
  end
end
