require "../../spec_helper"
require "../../../src/core_ext/hash/deep_transform_values"

describe Hash do
  describe "#deep_transform_values" do
    it "works" do
      {
        :a => 1,
        :b => [1, 2, 3],
        :c => {
          :foo => 2,
        },
      }.deep_transform_values(&.to_s).should eq({
        :a => "1",
        :b => ["1", "2", "3"],
        :c => {
          :foo => "2",
        },
      })
    end
  end
end
