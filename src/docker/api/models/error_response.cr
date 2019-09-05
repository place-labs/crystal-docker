require "json"

struct Docker::Api::Models::ErrorResponse
  JSON.mapping({
    message: {type: String, setter: false},
  })
end
