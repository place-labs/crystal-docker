require "../../../spec_helper"

describe Docker::Api::Models::CreateContainerResponse do
  it "parses from JSON" do
    Docker::Api::Models::CreateContainerResponse.from_json(<<-JSON
      {
       "Id": "e90e34656806",
       "Warnings": []
      }
      JSON
    ).should be_a(Docker::Api::Models::CreateContainerResponse)
  end
end
