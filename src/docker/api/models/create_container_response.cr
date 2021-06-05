require "./response"

module Docker::Api::Models
  struct CreateContainerResponse < Response
    @[JSON::Field(key: "Id")]
    getter id : String
    @[JSON::Field(key: "Warnings")]
    getter warnings : Array(String)?
  end
end
