require "../../spec_helper"
require "../../../src/core_ext/named_tuple/camelcase_keys"

describe NamedTuple do
  describe "#camelcase_keys" do
    it "works" do
      {
        foo: 1,
        bar: {
          example_key: 2,
        },
      }.camelcase_keys.should eq({
        "Foo" => 1,
        "Bar" => {
          "ExampleKey" => 2,
        },
      })
    end
  end
end
