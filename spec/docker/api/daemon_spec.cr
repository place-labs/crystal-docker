require "../../spec_helper"

describe Docker::Api::Daemon do
  client = Docker::Api::ApiClient.new

  describe "#ping" do
    it "supports base ping query" do
      WebMock.stub(:get, "#{client.connection.host}/_ping").to_return body: "OK"
      client.ping.should be_true
    end
  end

  describe "#version" do
    it "supports version queries" do
      WebMock.stub(:get, "#{client.connection.host}/version").to_return(body: <<-JSON
        {
            "Version": "17.04.0",
            "Os": "linux",
            "KernelVersion": "3.19.0-23-generic",
            "GoVersion": "go1.7.5",
            "GitCommit": "deadbee",
            "Arch": "amd64",
            "ApiVersion": "1.27",
            "MinAPIVersion": "1.12",
            "BuildTime": "2016-06-14T07:09:13.444803460+00:00",
            "Experimental": true
        }
        JSON
      )
      version = client.version
      version.version.should eq("17.04.0")
      version.os.should eq("linux")
    end
  end
end
