require "../../spec_helper"

describe Docker::Api::Client do
  client = Docker::Api::Client.new

  describe "base HTTP methods" do
    {% for method in %w(get post put head delete patch options) %}
      it "{{method.id}}" do
        WebMock.stub :{{method.id}}, "#{client.client.host}/foo"
        response = client.{{method.id}} "/foo"
        response.status_code.should eq(200)
      end
    {% end %}
  end

  it "supports specifying a custom API version" do
    versioned_client = Docker::Api::Client.new version: "v1.23"
    WebMock.stub :any, "#{versioned_client.client.host}/#{versioned_client.version}/foo"
    response = versioned_client.get "/foo"
    response.status_code.should eq(200)
  end

  it "raises an exception on error response" do
    WebMock.stub(:get, "#{client.client.host}/foo").to_return do
      HTTP::Client::Response.new(500, body: "{ \"message\": \"This is an error\" }")
    end
    expect_raises(Docker::ApiError, "This is an error") do
      client.get "/foo"
    end
  end

  describe "#ping" do
    it "supports base ping query" do
      WebMock.stub(:get, "#{client.client.host}/_ping").to_return body: "OK"
      client.ping.should be_true
    end
  end
end
