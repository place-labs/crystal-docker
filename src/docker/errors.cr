require "http/client/response"
require "./api/models/error_response"

module Docker
  # Base class for domain-specific errors.
  class DockerException < Exception; end

  class ApiError < DockerException
    def self.from_response(response : HTTP::Client::Response)
      if response.success?
        # Shouldn't ever be passed through here...
        raise ArgumentError.new "response is valid"
      else
        error = Api::Models::ErrorResponse.from_json response.body
        new response.status_code, error.message
      end
    end

    def initialize(@status_code, message = "")
      super message
    end

    getter status_code : Int32
  end
end
