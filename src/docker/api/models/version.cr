require "json"

struct Docker::Api::Models::Version
  JSON.mapping({
    version:         {setter: false, key: "Version", type: String},
    os:              {setter: false, key: "Os", type: String},
    kernel_version:  {setter: false, key: "KernelVersion", type: String},
    go_version:      {setter: false, key: "GoVersion", type: String},
    git_commit:      {setter: false, key: "GitCommit", type: String},
    arch:            {setter: false, key: "Arch", type: String},
    api_version:     {setter: false, key: "ApiVersion", type: String},
    min_api_version: {setter: false, key: "MinAPIVersion", type: String},
    build_time:      {setter: false, key: "BuildTime", type: String},
    experimental:    {setter: false, key: "Experimental", type: Bool},
  })
end
