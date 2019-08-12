require "./models/container"

module Docker::Api::Containers
  def inspect_container(id : String)
    response = get "/containers/#{id}/json"
    Models::Container.from_json response.body
  end
end
