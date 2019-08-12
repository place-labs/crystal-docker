require "json"

struct Docker::Api::Models::Error
  JSON.mapping({
    message: {type: String, setter: false},
  })
end
