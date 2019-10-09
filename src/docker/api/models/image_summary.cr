require "json"

struct Docker::Api::Models::ImageSummary
  JSON.mapping({
    containers:   {key: "Containers", type: Int32},
    created:      {key: "Created", type: Int32},
    id:           {key: "Id", type: String},
    labels:       {key: "Labels", type: Hash(String, String)?},
    parent_id:    {key: "ParentId", type: String},
    repo_digests: {key: "RepoDigests", type: Array(String)?},
    repo_tags:    {key: "RepoTags", type: Array(String)?},
    shared_size:  {key: "SharedSize", type: Int32},
    size:         {key: "Size", type: Int32},
    virtual_size: {key: "VirtualSize", type: Int32},
  })
end
