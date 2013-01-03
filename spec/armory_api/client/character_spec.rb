# encoding: utf-8
require 'helper'

describe ArmoryApi::Client::Character do
  describe ".character" do
    before do
      @client = ArmoryApi::Client.new realm: 'realm'
    end

    context "without a realm passed" do
      it "returns the character" do
        stub_request(:get, 'http://us.battle.net/api/wow/character/realm/peratryn')
          .to_return(body: fixture('character/character.json'))
        char = @client.character('peratryn')
        expect(char.name.downcase).to eq 'peratryn'
      end

      it "returns the character with additional fields" do
        stub_request(:get, 'http://us.battle.net/api/wow/character/realm/peratryn?fields=feed')
          .to_return(body: fixture('character/character-feed.json'))
        char = @client.character('peratryn', ['feed'])
        expect(char.feed).to be_an Array
      end

      it "raises an error if the client does not have a realm set" do
        client = ArmoryApi::Client.new
        expect{client.character('peratryn')}.to raise_error(ArmoryApi::RealmNotFound)
      end
    end

    context "with a realm passed" do
      before do
        @client = ArmoryApi::Client.new
      end

      it "returns the character" do
        stub_request(:get, 'http://us.battle.net/api/wow/character/realm/peratryn')
          .to_return(body: fixture('character/character.json'))
        char = @client.character('peratryn', 'realm')
        expect(char.name.downcase).to eq 'peratryn'
      end

      it "returns the character with additional fields" do
        stub_request(:get, 'http://us.battle.net/api/wow/character/realm/peratryn?fields=feed')
          .to_return(body: fixture('character/character-feed.json'))
        char = @client.character('peratryn', 'realm', ['feed'])
        expect(char.feed).to be_an Array
      end
    end

    context "with a name rich name" do
      it "works" do
        stub_request(:get, 'http://us.battle.net/api/wow/character/realm/Nor%C3%B0ri')
          .to_return(body: fixture('character/character.json'))
        char = ArmoryApi.character('Norðri', 'realm')
        expect(char.name).not_to be_nil
      end
    end
  end
end
