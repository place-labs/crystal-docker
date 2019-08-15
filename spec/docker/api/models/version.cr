require "../../../spec_helper"

describe Docker::Api::Models::Version do
  it "parses from JSON" do
    Docker::Api::Models::Version.from_json(<<-JSON
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
    ).should be_a(Docker::Api::Models::Version)
  end
end
