require "./response"

module Docker::Api::Models
  struct ErrorResponse < Response
    getter message : String
  end
end
