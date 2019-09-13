require "json"
require "./container"

struct Docker::Api::Models::ContainerSummary
  JSON.mapping({
    id:               {setter: false, key: "Id", type: String},
    names:            {setter: false, key: "Names", type: Array(String)},
    image:            {setter: false, key: "Image", type: String},
    image_id:         {setter: false, key: "ImageID", type: String},
    command:          {setter: false, key: "Command", type: String},
    created:          {setter: false, key: "Created", type: Time, converter: Time::EpochConverter},
    state:            {setter: false, key: "State", type: String},
    status:           {setter: false, key: "Status", type: String},
    ports:            {setter: false, key: "Ports", type: Array(PortBinding)},
    labels:           {setter: false, key: "Labels", type: Hash(String, String)},
    size_rw:          {setter: false, key: "SizeRw", type: Int32?},
    size_root_fs:     {setter: false, key: "SizeRootFs", type: Int32?},
    host_config:      {setter: false, key: "HostConfig", type: HostConfig},
    network_settings: {setter: false, key: "NetworkSettings", type: NetworkSettings},
    mounts:           {setter: false, key: "Mounts", type: Array(Container::Mount)},
  })

  struct PortBinding
    JSON.mapping({
      ip:           {setter: false, key: "IP", type: String?},
      private_port: {setter: false, key: "PrivatePort", type: Int32},
      public_port:  {setter: false, key: "PublicPort", type: Int32?},
      type:         {setter: false, key: "Type", type: String},
    })
  end

  struct HostConfig
    JSON.mapping({
      network_mode: {setter: false, key: "NetworkMode", type: String},
    })
  end

  struct NetworkSettings
    JSON.mapping({
      networks: {setter: false, key: "Networks", type: Hash(String, Container::NetworkSettings::Network)},
    })
  end
end
