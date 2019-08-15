require "../../../spec_helper"

describe Docker::Api::Models::Error do
  it "parses from JSON" do
    Docker::Api::Models::Error.from_json( <<-JSON
      {
        "message": "page not found"
      }
    JSON
    ).should be_a(Docker::Api::Models::Error)
  end
end
