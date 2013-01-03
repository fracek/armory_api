require 'helper'

describe ArmoryApi::Client::Item do
  before do
    @client = ArmoryApi::Client.new
  end

  describe ".item" do
    it "returns the item" do
      stub_request(:get, 'http://us.battle.net/api/wow/item/18803')
        .to_return(body: fixture('item/item.json'))
      item = @client.item(18803)
      expect(item.id).to eq 18803
    end
  end

  describe ".item_set" do
    context "with full set to true" do
      it "returns the set with each item informations" do
        stub_request(:get, 'http://us.battle.net/api/wow/item/set/1060')
          .to_return(body: fixture('item/item-set.json'))
        5.times do
          stub_request(:get, /http:\/\/us.battle.net\/api\/wow\/item\/\d*$/)
            .to_return(body: fixture('item/item.json'))
        end
        set = @client.item_set(1060, true)
        expect(set.id).to eq 1060
        set.items.each do |item|
          expect(item).to be_a Hash
        end
      end
    end

    context "without full set to true" do
      it "returns the set" do
        stub_request(:get, 'http://us.battle.net/api/wow/item/set/1060')
          .to_return(body: fixture('item/item-set.json'))
        set = @client.item_set(1060)
        expect(set.id).to eq 1060
      end
    end
  end
end
