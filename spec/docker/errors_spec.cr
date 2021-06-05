require "../spec_helper"

describe Docker::ApiError do
  it "build exceptions from HTTP responses" do
    response = HTTP::Client::Response.new 500, {message: "foo"}.to_json
    exception = Docker::ApiError.from_response response
    exception.message.should eq("foo")
    exception.status_code.should eq(500)
  end
end
