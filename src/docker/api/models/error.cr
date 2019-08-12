require "json"

struct Docker::Api::Models::Error
  JSON.mapping(
    message: String
  )
end
