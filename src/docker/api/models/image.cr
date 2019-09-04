require "json"

struct Docker::Api::Models::Image
  JSON.mapping({
    id:               {setter: false, key: "Id", type: String},
    container:        {setter: false, key: "Container", type: String},
    comment:          {setter: false, key: "Comment", type: String},
    os:               {setter: false, key: "Os", type: String},
    architecture:     {setter: false, key: "Architecture", type: String},
    parent:           {setter: false, key: "Parent", type: String},
    container_config: {setter: false, key: "ContainerConfig", type: JSON::Any},
    docker_version:   {setter: false, key: "DockerVersion", type: String},
    virtual_size:     {setter: false, key: "VirtualSize", type: Int32},
    size:             {setter: false, key: "Size", type: Int32},
    author:           {setter: false, key: "Author", type: String},
    created:          {setter: false, key: "Created", type: Time},
    graph_driver:     {setter: false, key: "GraphDriver", type: JSON::Any},
    repo_digests:     {setter: false, key: "RepoDigests", type: Array(String)},
    repo_tags:        {setter: false, key: "RepoTags", type: Array(String)},
    config:           {setter: false, key: "Config", type: JSON::Any},
    root_fs:          {setter: false, key: "RootFS", type: JSON::Any},
  })
end
