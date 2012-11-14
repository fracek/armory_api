require 'helper'

describe ArmoryApi::Client do
  describe "region" do
    after :each do
      ArmoryApi.reset
    end

    it "defaults to us" do
      c = ArmoryApi::Client.new
      expect(c.region).to eq 'us'
    end

    it "is settable" do
      ArmoryApi.region = 'eu'
      c = ArmoryApi::Client.new
      expect(c.region).to eq 'eu'
    end
  end

  describe "locale" do
    after :each do
      ArmoryApi.reset
    end

    it "defaults to en_US" do
      c = ArmoryApi::Client.new
      expect(c.locale).to eq 'en_US'
    end

    it "is settable" do
      ArmoryApi.locale = 'en_GB'
      c = ArmoryApi::Client.new
      expect(c.locale).to eq 'en_GB'
    end
  end

  describe "realm" do
    after :each do
      ArmoryApi.reset
    end

    it "defaults to nil" do
      c = ArmoryApi::Client.new
      expect(c.realm).to be_nil
    end

    it "is settable" do
      ArmoryApi.realm = 'Stormrage'
      c = ArmoryApi::Client.new
      expect(c.realm).to eq 'Stormrage'
    end
  end
end
