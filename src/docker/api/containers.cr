require "./models/container"
require "./models/container_summary"

module Docker::Api::Containers
  # List containers. Similar to the docker ps command.
  def containers(all : Bool? = nil, limit : Int? = nil, size : Bool? = nil, filters : String? = nil)
    params = HTTP::Params.build do |param|
      {% for arg in @def.args %}
        param.add {{arg.name.stringify}}, {{arg.name}}.to_s unless {{arg.name}}.nil?
      {% end %}
    end
    response = get "/containers/json?#{params}"
    Array(Models::ContainerSummary).from_json response.body
  end

  # Identical to the docker inspect command, but only for containers.
  def inspect_container(id : String)
    response = get "/containers/#{id}/json"
    Models::Container.from_json response.body
  end
end
