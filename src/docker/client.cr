require "./api/client"

class Docker::Client
  private getter client : Docker::Api::Client

  def initialize(base_url = Docker::Api::Client::DEFAULT_URL)
    @client = Docker::Api::Client.new base_url
  end
end
