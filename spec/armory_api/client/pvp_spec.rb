require 'helper'

describe ArmoryApi::Client::Pvp do
  before do
    @client = ArmoryApi::Client.new
  end

  describe ".pvp_ladder" do
    context "with only the battlegroup and team size passed" do
      it "returns the first 50 teams" do
        stub_request(:get, 'http://us.battle.net/api/wow/pvp/arena/ruin/2v2')
          .to_return(body: fixture('pvp/arena_ladder.json'))
        ladder = @client.pvp_ladder('ruin', '2v2')
        expect(ladder).to be_an Array
        expect(ladder.count).to eq 50
      end
    end

    context "with paging options" do
      it "returns an array with the requested elements" do
        stub_request(:get, 'http://us.battle.net/api/wow/pvp/arena/ruin/2v2?page=2&size=30')
          .to_return(body: fixture('pvp/arena_ladder.json'))
        ladder = @client.pvp_ladder('ruin', '2v2', page: 2, size: 30)
        expect(ladder.count).to eq 30
      end
    end

    context "with order options" do
      context "when :desc" do
        it "returns the ladder in descending order" do
          stub_request(:get, 'http://us.battle.net/api/wow/pvp/arena/ruin/2v2?asc=false')
            .to_return(body: fixture('pvp/arena_ladder.json'))
          ladder = @client.pvp_ladder('ruin', '2v2', order: :desc)
          expect(ladder).to be_an Array
        end
      end

      context "when :asc" do
        it "returns the ladder in ascending order" do
          stub_request(:get, 'http://us.battle.net/api/wow/pvp/arena/ruin/2v2')
            .to_return(body: fixture('pvp/arena_ladder.json'))
          ladder = @client.pvp_ladder('ruin', '2v2', order: :asc)
          expect(ladder).to be_an Array
        end
      end
    end
  end
end
