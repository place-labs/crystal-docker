require "json"

struct Docker::Api::Models::BuildInfo
  JSON.mapping({
    id:              {setter: false, key: "id", type: String?},
    stream:          {setter: false, key: "stream", type: String?},
    error:           {setter: false, key: "error", type: String?},
    error_detail:    {setter: false, key: "errorDetail", type: ErrorDetail?},
    status:          {setter: false, key: "status", type: String?},
    progress:        {setter: false, key: "progress", type: String?},
    progress_detail: {setter: false, key: "progressDetail", type: ProgressDetail?},
  })

  struct ErrorDetail
    JSON.mapping({
      code:    {setter: false, key: "code", type: Int32},
      message: {setter: false, key: "message", type: String},
    })
  end

  struct ProgressDetail
    JSON.mapping({
      current: {setter: false, key: "current", type: Int32},
      total:   {setter: false, key: "total", type: Int32},
    })
  end
end
