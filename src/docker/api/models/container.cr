require "./response"

module Docker::Api::Models
  struct Container < Response
    @[JSON::Field(key: "AppArmorProfile")]
    getter app_armor_profile : String
    @[JSON::Field(key: "Args")]
    getter args : Array(String)
    @[JSON::Field(key: "Config")]
    getter config : Config
    @[JSON::Field(key: "Created")]
    getter created : Time
    @[JSON::Field(key: "Driver")]
    getter driver : String
    @[JSON::Field(key: "ExecIDs")]
    getter exec_ids : Array(String)?
    @[JSON::Field(key: "HostConfig")]
    getter host_config : HostConfig
    @[JSON::Field(key: "HostnamePath")]
    getter hostname_path : String
    @[JSON::Field(key: "HostsPath")]
    getter hosts_path : String
    @[JSON::Field(key: "LogPath")]
    getter log_path : String
    @[JSON::Field(key: "Id")]
    getter id : String
    @[JSON::Field(key: "Image")]
    getter image : String
    @[JSON::Field(key: "MountLabel")]
    getter mount_label : String
    @[JSON::Field(key: "Name")]
    getter name : String

    @[JSON::Field(key: "NetworkSettings")]
    getter network_settings : NetworkSettings
    @[JSON::Field(key: "Path")]
    getter path : String
    @[JSON::Field(key: "ProcessLabel")]
    getter process_label : String
    @[JSON::Field(key: "ResolvConfPath")]
    getter resolv_conf_path : String
    @[JSON::Field(key: "RestartCount")]
    getter restart_count : Int32
    @[JSON::Field(key: "State")]
    getter state : State
    @[JSON::Field(key: "Mounts")]
    getter mounts : Array(Mount)

    struct Config < Response
      @[JSON::Field(key: "AttachStderr")]
      getter attach_stderr : Bool
      @[JSON::Field(key: "AttachStdin")]
      getter attach_stdin : Bool
      @[JSON::Field(key: "AttachStdout")]
      getter attach_stdout : Bool
      @[JSON::Field(key: "Cmd")]
      getter cmd : Array(String)?
      @[JSON::Field(key: "Domainname")]
      getter domainname : String
      @[JSON::Field(key: "Env")]
      getter env : Array(String)
      @[JSON::Field(key: "Hostname")]
      getter hostname : String
      @[JSON::Field(key: "Image")]
      getter image : String
      @[JSON::Field(key: "Labels")]
      getter labels : Hash(String, String)
      @[JSON::Field(key: "MacAddress")]
      getter mac_address : String?
      @[JSON::Field(key: "NetworkDisabled")]
      getter network_disabled : Bool?
      @[JSON::Field(key: "OpenStdin")]
      getter open_stdin : Bool
      @[JSON::Field(key: "StdinOnce")]
      getter stdin_once : Bool
      @[JSON::Field(key: "Tty")]
      getter tty : Bool
      @[JSON::Field(key: "User")]
      getter user : String
      @[JSON::Field(key: "Volumes")]
      getter volumes : Hash(String, JSON::Any)?
      @[JSON::Field(key: "WorkingDir")]
      getter working_dir : String
      @[JSON::Field(key: "StopSignal")]
      getter stop_signal : String?
      @[JSON::Field(key: "StopTimeout")]
      getter stop_timeout : Int32?
    end

    struct HostConfig < Response
      @[JSON::Field(key: "MaximumIOps")]
      getter maxium_iops : Int32?
      @[JSON::Field(key: "MaximumIOBps")]
      getter maxium_iobps : Int32?
      @[JSON::Field(key: "BlkioWeight")]
      getter blkio_weight : Int32
      @[JSON::Field(key: "BlkioWeightDevice")]
      getter blkio_weight_device : Array(JSON::Any)?
      @[JSON::Field(key: "BlkioDeviceReadBps")]
      getter blkio_device_read_bps : Array(JSON::Any)?
      @[JSON::Field(key: "BlkioDeviceWriteBps")]
      getter blkio_device_write_bps : Array(JSON::Any)?
      @[JSON::Field(key: "BlkioDeviceReadIOps")]
      getter blkio_device_read_iops : Array(JSON::Any)?
      @[JSON::Field(key: "BlkioDeviceWriteIOps")]
      getter blkio_device_write_iops : Array(JSON::Any)?
      @[JSON::Field(key: "ContainerIDFile")]
      getter container_id_file : String
      @[JSON::Field(key: "CpusetCpus")]
      getter cpuset_cpus : String
      @[JSON::Field(key: "CpusetMems")]
      getter cpuset_mems : String
      @[JSON::Field(key: "CpuPercent")]
      getter cpu_percent : Int32
      @[JSON::Field(key: "CpuShares")]
      getter cpu_shares : Int32
      @[JSON::Field(key: "CpuPeriod")]
      getter cpu_period : Int32
      @[JSON::Field(key: "CpuRealtimePeriod")]
      getter cpu_realtime_period : Int32
      @[JSON::Field(key: "CpuRealtimeRuntime")]
      getter cpu_runtime_period : Int32
      @[JSON::Field(key: "Devices")]
      getter devices : Array(JSON::Any)?
      @[JSON::Field(key: "IpcMode")]
      getter ipc_mode : String
      @[JSON::Field(key: "LxcConf")]
      getter lxc_conf : Array(JSON::Any)?
      @[JSON::Field(key: "Memory")]
      getter memory : Int32
      @[JSON::Field(key: "MemorySwap")]
      getter memory_swap : Int32
      @[JSON::Field(key: "MemoryReservation")]
      getter memory_reservation : Int32
      @[JSON::Field(key: "KernelMemory")]
      getter kernel_memory : Int32
      @[JSON::Field(key: "OomKillDisable")]
      getter oom_kill_disable : Bool
      @[JSON::Field(key: "OomScoreAdj")]
      getter joom_score_adj : Int32
      @[JSON::Field(key: "NetworkMode")]
      getter network_mode : String
      @[JSON::Field(key: "PidMode")]
      getter pid_mode : String
      @[JSON::Field(key: "PortBindings")]
      getter port_bindings : JSON::Any?
      @[JSON::Field(key: "Privileged")]
      getter privileged : Bool
      @[JSON::Field(key: "ReadonlyRootfs")]
      getter readonly_rootfs : Bool
      @[JSON::Field(key: "PublishAllPorts")]
      getter publish_all_ports : Bool
      @[JSON::Field(key: "RestartPolicy")]
      getter restart_policy : JSON::Any?
      @[JSON::Field(key: "LogConfig")]
      getter log_config : JSON::Any?
      @[JSON::Field(key: "Sysctls")]
      getter sysctls : JSON::Any?
      @[JSON::Field(key: "Ulimits")]
      getter ulimits : Array(JSON::Any)?
      @[JSON::Field(key: "VolumeDriver")]
      getter volume_driver : String
      @[JSON::Field(key: "ShmSize")]
      getter shm_size : Int32
    end

    struct NetworkSettings < Response
      @[JSON::Field(key: "Bridge")]
      getter bridge : String
      @[JSON::Field(key: "SandboxID")]
      getter sandbox_id : String
      @[JSON::Field(key: "HairpinMode")]
      getter hairpin_mode : Bool
      @[JSON::Field(key: "LinkLocalIPv6Address")]
      getter link_local_ipv6_address : String
      @[JSON::Field(key: "LinkLocalIPv6PrefixLen")]
      getter link_local_ipv6_prefix_len : Int32
      @[JSON::Field(key: "SandboxKey")]
      getter sandbox_key : String
      @[JSON::Field(key: "EndpointID")]
      getter endpoint_id : String
      @[JSON::Field(key: "Gateway")]
      getter gateway : String
      @[JSON::Field(key: "GlobalIPv6Address")]
      getter global_ipv6_address : String
      @[JSON::Field(key: "GlobalIPv6PrefixLen")]
      getter global_ipv6_prefix_len : Int32
      @[JSON::Field(key: "IPAddress")]
      getter ip_address : String
      @[JSON::Field(key: "IPPrefixLen")]
      getter ip_prefix_len : Int32
      @[JSON::Field(key: "IPv6Gateway")]
      getter ipv6_gatway : String
      @[JSON::Field(key: "MacAddress")]
      getter mac_address : String
      @[JSON::Field(key: "Networks")]
      getter networks : Hash(String, Network)

      struct Network < Response
        @[JSON::Field(key: "NetworkID")]
        getter network_id : String
        @[JSON::Field(key: "EndpointID")]
        getter endpoint_id : String
        @[JSON::Field(key: "Gateway")]
        getter gateway : String
        @[JSON::Field(key: "IPAddress")]
        getter ip_address : String
        @[JSON::Field(key: "IPPrefixLen")]
        getter ip_prefix_len : Int32
        @[JSON::Field(key: "IPv6Gateway")]
        getter ipv6_gatway : String
        @[JSON::Field(key: "GlobalIPv6Address")]
        getter global_ipv6_address : String
        @[JSON::Field(key: "GlobalIPv6PrefixLen")]
        getter global_ipv6_prefix_len : Int32
        @[JSON::Field(key: "MacAddress")]
        getter mac_address : String
      end
    end

    struct State < Response
      @[JSON::Field(key: "Error")]
      getter error : String
      @[JSON::Field(key: "ExitCode")]
      getter exit_code : Int32
      @[JSON::Field(key: "FinishedAt")]
      getter finished_at : Time
      @[JSON::Field(key: "OOMKilled")]
      getter oom_killed : Bool
      @[JSON::Field(key: "Dead")]
      getter dead : Bool
      @[JSON::Field(key: "Paused")]
      getter paused : Bool
      @[JSON::Field(key: "Pid")]
      getter pid : Int32
      @[JSON::Field(key: "Restarting")]
      getter restarting : Bool
      @[JSON::Field(key: "Running")]
      getter running : Bool
      @[JSON::Field(key: "StartedAt")]
      getter started_at : Time
      @[JSON::Field(key: "Status")]
      getter status : String
    end

    struct Mount < Response
      @[JSON::Field(key: "Name")]
      getter name : String?
      @[JSON::Field(key: "Source")]
      getter source : String
      @[JSON::Field(key: "Destination")]
      getter destination : String
      @[JSON::Field(key: "Driver")]
      getter driver : String?
      @[JSON::Field(key: "Mode")]
      getter mode : String
      @[JSON::Field(key: "RW")]
      getter rw : Bool
      @[JSON::Field(key: "Propagation")]
      getter propogation : String
    end
  end
end
