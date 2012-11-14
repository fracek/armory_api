require 'helper'

describe ArmoryApi do
  describe ".new" do
    it "is an ArmoryApi::Client" do
      expect(ArmoryApi.new).to be_a ArmoryApi::Client
    end
  end
end
