require "./response"

module Docker::Api::Models
  struct BuildInfo < Response
    getter id : String?
    getter stream : String?
    getter error : String?
    @[JSON::Field(key: "errorDetail")]
    getter error_detail : ErrorDetail?
    getter status : String?
    getter progress : String?
    @[JSON::Field(key: "progressDetail")]
    getter progress_detail : ProgressDetail?

    struct ErrorDetail < Response
      getter code : Int32
      getter message : String
    end

    struct ProgressDetail < Response
      getter current : Int32
      getter total : Int32
    end
  end
end
