require "../../spec_helper"

describe Docker::Api::ApiClient do
  client = Docker::Api::ApiClient.new

  describe "base HTTP methods" do
    {% for method in %w(get post put head delete patch options) %}
      it "{{method.id}}" do
        WebMock.stub :{{method.id}}, "#{client.connection.host}/foo"
        response = client.{{method.id}} "/foo"
        response.status_code.should eq(200)
      end
    {% end %}
  end

  it "supports specifying a custom API version" do
    versioned_client = Docker::Api::ApiClient.new api_version: "v1.23"
    WebMock.stub :any, "#{versioned_client.connection.host}/#{versioned_client.api_version}/foo"
    response = versioned_client.get "/foo"
    response.status_code.should eq(200)
  end

  it "raises an exception on error response" do
    WebMock.stub(:get, "#{client.connection.host}/foo").to_return do
      HTTP::Client::Response.new(500, body: "{ \"message\": \"This is an error\" }")
    end
    expect_raises(Docker::ApiError, "This is an error") do
      client.get "/foo"
    end
  end
end
