require "./models/container"
require "./models/container_summary"

module Docker::Api::Containers
  def inspect_container(id : String)
    response = get "/containers/#{id}/json"
    Models::Container.from_json response.body
  end
end
