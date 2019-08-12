require "../../spec_helper"

describe Docker::Api::Client do
  describe "base HTTP methods" do
    client = Docker::Api::Client.new
    {% for method in %w(get post put head delete patch options) %}
      it "{{method.id}}" do
        WebMock.stub :{{method.id}}, "#{client.client.host}/foo"
        response = client.{{method.id}} "/foo"
        response.status_code.should eq(200)
      end
    {% end %}
  end

  it "supports specifying a custom API version" do
    client = Docker::Api::Client.new version: "v1.23"
    WebMock.stub :any, "#{client.client.host}/#{client.version}/foo"
    response = client.get "/foo"
    response.status_code.should eq(200)
  end

  it "raises an exception on error response" do
    client = Docker::Api::Client.new
    WebMock.stub(:get, "#{client.client.host}/foo").to_return do
      HTTP::Client::Response.new(500, body: "{ \"message\": \"This is an error\" }")
    end
    expect_raises(Docker::ApiError, "This is an error") do
      client.get "/foo"
    end
  end
end
