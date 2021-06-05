require "./container"
require "./response"

module Docker::Api::Models
  struct ContainerSummary < Response
    @[JSON::Field(key: "Id")]
    getter id : String
    @[JSON::Field(key: "Names")]
    getter names : Array(String)
    @[JSON::Field(key: "Image")]
    getter image : String
    @[JSON::Field(key: "ImageID")]
    getter image_id : String
    @[JSON::Field(key: "Command")]
    getter command : String
    @[JSON::Field(key: "Created", converter: Time::EpochConverter)]
    getter created : Time
    @[JSON::Field(key: "State")]
    getter state : String
    @[JSON::Field(key: "Status")]
    getter status : String
    @[JSON::Field(key: "Ports")]
    getter ports : Array(PortBinding)
    @[JSON::Field(key: "Labels")]
    getter labels : Hash(String, String)
    @[JSON::Field(key: "SizeRw")]
    getter size_rw : Int32?
    @[JSON::Field(key: "SizeRootFs")]
    getter size_root_fs : Int32?
    @[JSON::Field(key: "HostConfig")]
    getter host_config : HostConfig
    @[JSON::Field(key: "NetworkSettings")]
    getter network_settings : NetworkSettings
    @[JSON::Field(key: "Mounts")]
    getter mounts : Array(Container::Mount)

    struct PortBinding < Response
      @[JSON::Field(key: "IP")]
      getter ip : String?
      @[JSON::Field(key: "PrivatePort")]
      getter private_port : Int32
      @[JSON::Field(key: "PublicPort")]
      getter public_port : Int32?
      @[JSON::Field(key: "Type")]
      getter type : String
    end

    struct HostConfig < Response
      @[JSON::Field(key: "NetworkMode")]
      getter network_mode : String
    end

    struct NetworkSettings < Response
      @[JSON::Field(key: "Networks")]
      getter networks : Hash(String, Container::NetworkSettings::Network)
    end
  end
end
