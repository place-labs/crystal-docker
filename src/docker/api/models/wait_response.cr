require "./response"

module Docker::Api::Models
  struct WaitResponse < Response
    @[JSON::Field(key: "StatusCode")]
    getter status_code : Int32
    @[JSON::Field(key: "Error")]
    getter error : Error

    struct Error < Response
      @[JSON::Field(key: "Message")]
      getter message : String
    end
  end
end
