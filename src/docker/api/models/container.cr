require "json"

struct Docker::Api::Models::Container
  JSON.mapping({
    app_armor_profile: {setter: false, key: "AppArmorProfile", type: String},
    args:              {setter: false, key: "Args", type: Array(String)},
    config:            {setter: false, key: "Config", type: Config},
    created:           {setter: false, key: "Created", type: Time},
    driver:            {setter: false, key: "Driver", type: String},
    exec_ids:          {setter: false, key: "ExecIDs", type: Array(String)?},
    host_config:       {setter: false, key: "HostConfig", type: HostConfig},
    hostname_path:     {setter: false, key: "HostnamePath", type: String},
    hosts_path:        {setter: false, key: "HostsPath", type: String},
    log_path:          {setter: false, key: "LogPath", type: String},
    id:                {setter: false, key: "Id", type: String},
    image:             {setter: false, key: "Image", type: String},
    mount_label:       {setter: false, key: "MountLabel", type: String},
    name:              {setter: false, key: "Name", type: String},
    network_settings:  {setter: false, key: "NetworkSettings", type: NetworkSettings},
    path:              {setter: false, key: "Path", type: String},
    process_label:     {setter: false, key: "ProcessLabel", type: String},
    resolv_conf_path:  {setter: false, key: "ResolvConfPath", type: String},
    restart_count:     {setter: false, key: "RestartCount", type: Int32},
    state:             {setter: false, key: "State", type: State},
    mounts:            {setter: false, key: "Mounts", type: Array(Mount)},
  })

  struct Config
    JSON.mapping({
      attach_stderr:    {setter: false, key: "AttachStderr", type: Bool},
      attach_stdin:     {setter: false, key: "AttachStdin", type: Bool},
      attach_stdout:    {setter: false, key: "AttachStdout", type: Bool},
      cmd:              {setter: false, key: "Cmd", type: Array(String)},
      domainname:       {setter: false, key: "Domainname", type: String},
      env:              {setter: false, key: "Env", type: Array(String)},
      hostname:         {setter: false, key: "Hostname", type: String},
      image:            {setter: false, key: "Image", type: String},
      labels:           {setter: false, key: "Labels", type: Hash(String, String)},
      mac_address:      {setter: false, key: "MacAddress", type: String?},
      network_disabled: {setter: false, key: "NetworkDisabled", type: Bool?},
      open_stdin:       {setter: false, key: "OpenStdin", type: Bool},
      stdin_once:       {setter: false, key: "StdinOnce", type: Bool},
      tty:              {setter: false, key: "Tty", type: Bool},
      user:             {setter: false, key: "User", type: String},
      volumes:          {setter: false, key: "Volumes", type: Hash(String, JSON::Any)?},
      working_dir:      {setter: false, key: "WorkingDir", type: String},
      stop_signal:      {setter: false, key: "StopSignal", type: String?},
      stop_timeout:     {setter: false, key: "StopTimeout", type: Int32?},
    })
  end

  struct HostConfig
    JSON.mapping({
      maxium_iops:             {setter: false, key: "MaximumIOps", type: Int32?},
      maxium_iobps:            {setter: false, key: "MaximumIOBps", type: Int32?},
      blkio_weight:            {setter: false, key: "BlkioWeight", type: Int32},
      blkio_weight_device:     {setter: false, key: "BlkioWeightDevice", type: Array(JSON::Any)},
      blkio_device_read_bps:   {setter: false, key: "BlkioDeviceReadBps", type: Array(JSON::Any)?},
      blkio_device_write_bps:  {setter: false, key: "BlkioDeviceWriteBps", type: Array(JSON::Any)?},
      blkio_device_read_iops:  {setter: false, key: "BlkioDeviceReadIOps", type: Array(JSON::Any)?},
      blkio_device_write_iops: {setter: false, key: "BlkioDeviceWriteIOps", type: Array(JSON::Any)?},
      container_id_file:       {setter: false, key: "ContainerIDFile", type: String},
      cpuset_cpus:             {setter: false, key: "CpusetCpus", type: String},
      cpuset_mems:             {setter: false, key: "CpusetMems", type: String},
      cpu_percent:             {setter: false, key: "CpuPercent", type: Int32},
      cpu_shares:              {setter: false, key: "CpuShares", type: Int32},
      cpu_period:              {setter: false, key: "CpuPeriod", type: Int32},
      cpu_realtime_period:     {setter: false, key: "CpuRealtimePeriod", type: Int32},
      cpu_runtime_period:      {setter: false, key: "CpuRealtimeRuntime", type: Int32},
      devices:                 {setter: false, key: "Devices", type: Array(JSON::Any)},
      ipc_mode:                {setter: false, key: "IpcMode", type: String},
      lxc_conf:                {setter: false, key: "LxcConf", type: Array(JSON::Any)?},
      memory:                  {setter: false, key: "Memory", type: Int32},
      memory_swap:             {setter: false, key: "MemorySwap", type: Int32},
      memory_reservation:      {setter: false, key: "MemoryReservation", type: Int32},
      kernel_memory:           {setter: false, key: "KernelMemory", type: Int32},
      oom_kill_disable:        {setter: false, key: "OomKillDisable", type: Bool},
      joom_score_adj:          {setter: false, key: "OomScoreAdj", type: Int32},
      network_mode:            {setter: false, key: "NetworkMode", type: String},
      pid_mode:                {setter: false, key: "PidMode", type: String},
      port_bindings:           {setter: false, key: "PortBindings", type: JSON::Any},
      privileged:              {setter: false, key: "Privileged", type: Bool},
      readonly_rootfs:         {setter: false, key: "ReadonlyRootfs", type: Bool},
      publish_all_ports:       {setter: false, key: "PublishAllPorts", type: Bool},
      restart_policy:          {setter: false, key: "RestartPolicy", type: JSON::Any},
      log_config:              {setter: false, key: "LogConfig", type: JSON::Any},
      sysctls:                 {setter: false, key: "Sysctls", type: JSON::Any?},
      ulimits:                 {setter: false, key: "Ulimits", type: Array(JSON::Any)?},
      volume_driver:           {setter: false, key: "VolumeDriver", type: String},
      shm_size:                {setter: false, key: "ShmSize", type: Int32},
    })
  end

  struct NetworkSettings
    JSON.mapping({
      bridge:                     {setter: false, key: "Bridge", type: String},
      sandbox_id:                 {setter: false, key: "SandboxID", type: String},
      hairpin_mode:               {setter: false, key: "HairpinMode", type: Bool},
      link_local_ipv6_address:    {setter: false, key: "LinkLocalIPv6Address", type: String},
      link_local_ipv6_prefix_len: {setter: false, key: "LinkLocalIPv6PrefixLen", type: Int32},
      sandbox_key:                {setter: false, key: "SandboxKey", type: String},
      endpoint_id:                {setter: false, key: "EndpointID", type: String},
      gateway:                    {setter: false, key: "Gateway", type: String},
      global_ipv6_address:        {setter: false, key: "GlobalIPv6Address", type: String},
      global_ipv6_prefix_len:     {setter: false, key: "GlobalIPv6PrefixLen", type: Int32},
      ip_address:                 {setter: false, key: "IPAddress", type: String},
      ip_prefix_len:              {setter: false, key: "IPPrefixLen", type: Int32},
      ipv6_gatway:                {setter: false, key: "IPv6Gateway", type: String},
      mac_address:                {setter: false, key: "MacAddress", type: String},
      networks:                   {setter: false, key: "Networks", type: Hash(String, Network)},
    })

    struct Network
      JSON.mapping({
        network_id:             {setter: false, key: "NetworkID", type: String},
        endpoint_id:            {setter: false, key: "EndpointID", type: String},
        gateway:                {setter: false, key: "Gateway", type: String},
        ip_address:             {setter: false, key: "IPAddress", type: String},
        ip_prefix_len:          {setter: false, key: "IPPrefixLen", type: Int32},
        ipv6_gatway:            {setter: false, key: "IPv6Gateway", type: String},
        global_ipv6_address:    {setter: false, key: "GlobalIPv6Address", type: String},
        global_ipv6_prefix_len: {setter: false, key: "GlobalIPv6PrefixLen", type: Int32},
        mac_address:            {setter: false, key: "MacAddress", type: String},
      })
    end
  end

  struct State
    JSON.mapping({
      error:       {setter: false, key: "Error", type: String},
      exit_code:   {setter: false, key: "ExitCode", type: Int32},
      finished_at: {setter: false, key: "FinishedAt", type: Time},
      oom_killed:  {setter: false, key: "OOMKilled", type: Bool},
      dead:        {setter: false, key: "Dead", type: Bool},
      paused:      {setter: false, key: "Paused", type: Bool},
      pid:         {setter: false, key: "Pid", type: Int32},
      restarting:  {setter: false, key: "Restarting", type: Bool},
      running:     {setter: false, key: "Running", type: Bool},
      started_at:  {setter: false, key: "StartedAt", type: Time},
      status:      {setter: false, key: "Status", type: String},
    })
  end

  struct Mount
    JSON.mapping({
      name:        {setter: false, key: "Name", type: String},
      source:      {setter: false, key: "Source", type: String},
      destination: {setter: false, key: "Destination", type: String},
      driver:      {setter: false, key: "Driver", type: String},
      mode:        {setter: false, key: "Mode", type: String},
      rw:          {setter: false, key: "RW", type: Bool},
      propogation: {setter: false, key: "Propagation", type: String},
    })
  end
end
