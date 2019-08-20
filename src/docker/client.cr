require "./api_client_wrapper"
require "./containers"
require "./images"

# A client for communicating with a Docker server.
#
# Provides the main entrypoint for common interaction with a docker instance.
class Docker::Client
  include Docker::ApiClientWrapper

  # Creates a new instance for the passed *base_url*
  def initialize(base_url = Docker::Api::ApiClient::DEFAULT_URL)
    @client = Docker::Api::ApiClient.new base_url
  end

  {% for component in %w(containers images) %}
    # Provide an object for managing {{component.id}}. See `Docker::{{component.id.capitalize}}`.
    def {{component.id}} : {{component.id.capitalize}}
      @{{component.id}} ||= {{component.id.capitalize}}.new client
    end
  {% end %}
end
