require "json"

struct Docker::Api::Models::Image
  JSON.mapping({
    id:               {setter: false, key: "Id", type: String},
    container:        {setter: false, key: "Container", type: String},
    comment:          {setter: false, key: "Comment", type: String},
    os:               {setter: false, key: "Os", type: String},
    architecture:     {setter: false, key: "Architecture", type: String},
    parent:           {setter: false, key: "Parent", type: String},
    container_config: {setter: false, key: "ContainerConfig", type: Config},
    docker_version:   {setter: false, key: "DockerVersion", type: String},
    virtual_size:     {setter: false, key: "VirtualSize", type: Int32},
    size:             {setter: false, key: "Size", type: Int32},
    author:           {setter: false, key: "Author", type: String},
    created:          {setter: false, key: "Created", type: Time},
    graph_driver:     {setter: false, key: "GraphDriver", type: JSON::Any},
    repo_digests:     {setter: false, key: "RepoDigests", type: Array(String)},
    repo_tags:        {setter: false, key: "RepoTags", type: Array(String)?},
    config:           {setter: false, key: "Config", type: Config},
    root_fs:          {setter: false, key: "RootFS", type: JSON::Any},
  })

  struct Config
    JSON.mapping({
      hostname:      {setter: false, key: "Hostname", type: String},
      domainname:    {setter: false, key: "Domainname", type: String},
      user:          {setter: false, key: "User", type: String},
      attach_stdin:  {setter: false, key: "AttachStdin", type: Bool},
      attach_stdout: {setter: false, key: "AttachStdout", type: Bool},
      attach_stderr: {setter: false, key: "AttachStderr", type: Bool},
      exposed_ports: {setter: false, key: "ExposedPorts", type: Hash(String, Hash(String, String))?},
      tty:           {setter: false, key: "Tty", type: Bool},
      open_stdin:    {setter: false, key: "OpenStdin", type: Bool},
      stdin_once:    {setter: false, key: "StdinOnce", type: Bool},
      env:           {setter: false, key: "Env", type: Array(String)},
      cmd:           {setter: false, key: "Cmd", type: Array(String)?},
      healthcheck:   {setter: false, key: "Healthcheck", type: JSON::Any?},
      args_escaped:  {setter: false, key: "ArgsEscaped", type: Bool?},
      image:         {setter: false, key: "Image", type: String},
      volumes:       {setter: false, key: "Volumes", type: Hash(String, Hash(String, String))?},
      working_dir:   {setter: false, key: "WorkingDir", type: String},
      entrypoint:    {setter: false, key: "Entrypoint", type: Array(String)?},
      on_build:      {setter: false, key: "OnBuild", type: Array(String)?},
      labels:        {setter: false, key: "Labels", type: Hash(String, String)?},
    })
  end
end
