require "json"

struct Docker::Api::Models::Version
  JSON.mapping({
    version:         {key: "Version", type: String},
    os:              {key: "Os", type: String},
    kernel_version:  {key: "KernelVersion", type: String},
    go_version:      {key: "GoVersion", type: String},
    git_commit:      {key: "GitCommit", type: String},
    arch:            {key: "Arch", type: String},
    api_version:     {key: "ApiVersion", type: String},
    min_api_version: {key: "MinAPIVersion", type: String},
    build_time:      {key: "BuildTime", type: String},
    experimental:    {key: "Experimental", type: Bool},
  })
end
