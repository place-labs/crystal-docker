require "../../../spec_helper"

describe Docker::Api::Models::ErrorResponse do
  it "parses from JSON" do
    Docker::Api::Models::ErrorResponse.from_json(<<-JSON
     {
       "message": "page not found"
     }
   JSON
    ).should be_a(Docker::Api::Models::ErrorResponse)
  end
end
