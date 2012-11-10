require 'helper'

describe ArmoryApi do
  describe ".client" do
    it "returns a ArmoryApi::Client" do
      expect(ArmoryApi.client).to be_a ArmoryApi::Client
    end
  end
end
