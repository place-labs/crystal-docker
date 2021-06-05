require "../../../spec_helper"

describe Docker::Api::Models::WaitResponse do
  it "parses from JSON" do
    Docker::Api::Models::WaitResponse.from_json(<<-JSON
      {
        "StatusCode": 0,
        "Error": {
          "Message": "string"
        }
      }
      JSON
    ).should be_a(Docker::Api::Models::WaitResponse)
  end
end
