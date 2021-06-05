require "./response"

module Docker::Api::Models
  struct Version < Response
    @[JSON::Field(key: "Version")]
    getter version : String
    @[JSON::Field(key: "Os")]
    getter os : String
    @[JSON::Field(key: "KernelVersion")]
    getter kernel_version : String
    @[JSON::Field(key: "GoVersion")]
    getter go_version : String
    @[JSON::Field(key: "GitCommit")]
    getter git_commit : String
    @[JSON::Field(key: "Arch")]
    getter arch : String
    @[JSON::Field(key: "ApiVersion")]
    getter api_version : String
    @[JSON::Field(key: "MinAPIVersion")]
    getter min_api_version : String
    @[JSON::Field(key: "BuildTime")]
    getter build_time : Time
    @[JSON::Field(key: "Experimental")]
    getter experimental : Bool
  end
end
