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

  describe "connection" do
    after :each do
      ArmoryApi.reset
    end

    it "looks like a Farady connection" do
      c = ArmoryApi::Client.new
      expect(c.send('connection')).to respond_to(:run_request)
    end
  end

  describe "request" do
    it "encodes the params in the body" do
      stub_request(:get, 'http://us.battle.net/api/wow/character/realm/name?fields=one,two')
        .with(params: { fields: 'one,two' })
      c = ArmoryApi::Client.new
      c.character('name', 'realm', ['one', 'two'])
    end
  end
end
