require "json"

struct Docker::Api::Models::CreateContainerResponse
  JSON.mapping({
    id:       {setter: false, key: "Id", type: String},
    warnings: {setter: false, key: "Warnings", type: Array(String)?},
  })
end
