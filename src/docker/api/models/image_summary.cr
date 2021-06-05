require "./response"

module Docker::Api::Models
  struct ImageSummary < Response
    @[JSON::Field(key: "Containers")]
    getter containers : Int32
    @[JSON::Field(key: "Created")]
    getter created : Int32
    @[JSON::Field(key: "Id")]
    getter id : String
    @[JSON::Field(key: "Labels")]
    getter labels : Hash(String, String)?
    @[JSON::Field(key: "ParentId")]
    getter parent_id : String
    @[JSON::Field(key: "RepoDigests")]
    getter repo_digests : Array(String)?
    @[JSON::Field(key: "RepoTags")]
    getter repo_tags : Array(String)?
    @[JSON::Field(key: "SharedSize")]
    getter shared_size : Int32
    @[JSON::Field(key: "Size")]
    getter size : Int32
    @[JSON::Field(key: "VirtualSize")]
    getter virtual_size : Int32
  end
end
