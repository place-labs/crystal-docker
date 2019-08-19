require "json"
require "./error"

struct Docker::Api::Models::WaitResponse
  JSON.mapping({
    status_code: {setter: false, key: "StatusCode", type: Int32},
    error:       {setter: false, key: "Error", type: Error},
  })

  struct Error
    JSON.mapping({
      message: {setter: false, key: "Message", type: String},
    })
  end
end
