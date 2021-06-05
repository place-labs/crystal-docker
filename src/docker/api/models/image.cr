require "./response"

module Docker::Api::Models
  struct Image < Response
    @[JSON::Field(key: "Id")]
    getter id : String
    @[JSON::Field(key: "Container")]
    getter container : String
    @[JSON::Field(key: "Comment")]
    getter comment : String
    @[JSON::Field(key: "Os")]
    getter os : String
    @[JSON::Field(key: "Architecture")]
    getter architecture : String
    @[JSON::Field(key: "Parent")]
    getter parent : String
    @[JSON::Field(key: "ContainerConfig")]
    getter container_config : Config
    @[JSON::Field(key: "DockerVersion")]
    getter docker_version : String
    @[JSON::Field(key: "VirtualSize")]
    getter virtual_size : Int32
    @[JSON::Field(key: "Size")]
    getter size : Int32
    @[JSON::Field(key: "Author")]
    getter author : String
    @[JSON::Field(key: "Created")]
    getter created : Time
    @[JSON::Field(key: "GraphDriver")]
    getter graph_driver : JSON::Any
    @[JSON::Field(key: "RepoDigests")]
    getter repo_digests : Array(String)
    @[JSON::Field(key: "RepoTags")]
    getter repo_tags : Array(String)?
    @[JSON::Field(key: "Config")]
    getter config : Config
    @[JSON::Field(key: "RootFS")]
    getter root_fs : JSON::Any

    struct Config < Response
      @[JSON::Field(key: "Hostname")]
      getter hostname : String
      @[JSON::Field(key: "Domainname")]
      getter domainname : String
      @[JSON::Field(key: "User")]
      getter user : String
      @[JSON::Field(key: "AttachStdin")]
      getter attach_stdin : Bool
      @[JSON::Field(key: "AttachStdout")]
      getter attach_stdout : Bool
      @[JSON::Field(key: "AttachStderr")]
      getter attach_stderr : Bool
      @[JSON::Field(key: "ExposedPorts")]
      getter exposed_ports : Hash(String, Hash(String, String))?
      @[JSON::Field(key: "Tty")]
      getter tty : Bool
      @[JSON::Field(key: "OpenStdin")]
      getter open_stdin : Bool
      @[JSON::Field(key: "StdinOnce")]
      getter stdin_once : Bool
      @[JSON::Field(key: "Env")]
      getter env : Array(String)
      @[JSON::Field(key: "Cmd")]
      getter cmd : Array(String)?
      @[JSON::Field(key: "Healthcheck")]
      getter healthcheck : JSON::Any?
      @[JSON::Field(key: "ArgsEscaped")]
      getter args_escaped : Bool?
      @[JSON::Field(key: "Image")]
      getter image : String
      @[JSON::Field(key: "Volumes")]
      getter volumes : Hash(String, Hash(String, String))?
      @[JSON::Field(key: "WorkingDir")]
      getter working_dir : String
      @[JSON::Field(key: "Entrypoint")]
      getter entrypoint : Array(String)?
      @[JSON::Field(key: "OnBuild")]
      getter on_build : Array(String)?
      @[JSON::Field(key: "Labels")]
      getter labels : Hash(String, String)?
    end
  end
end
