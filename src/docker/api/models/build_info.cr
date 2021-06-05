require "./response"

module Docker::Api::Models
  struct BuildInfo < Response
    @[JSON::Field(key: "id")]
    getter id : String?
    @[JSON::Field(key: "stream")]
    getter stream : String?
    @[JSON::Field(key: "error")]
    getter error : String?
    @[JSON::Field(key: "errorDetail")]
    getter error_detail : ErrorDetail?
    @[JSON::Field(key: "status")]
    getter status : String?
    @[JSON::Field(key: "progress")]
    getter progress : String?
    @[JSON::Field(key: "progressDetail")]
    getter progress_detail : ProgressDetail?

    struct ErrorDetail < Response
      @[JSON::Field(key: "code")]
      getter code : Int32
      @[JSON::Field(key: "message")]
      getter message : String
    end

    struct ProgressDetail < Response
      @[JSON::Field(key: "current")]
      getter current : Int32
      @[JSON::Field(key: "total")]
      getter total : Int32
    end
  end
end
