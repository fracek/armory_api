require 'helper'

describe ArmoryApi::Client::Achievement do
  describe ".achievement" do
    before do
      @client = ArmoryApi::Client.new
    end

    it "returns the specified achievement" do
      stub_request(:get, 'http://us.battle.net/api/wow/achievement/2144')
        .to_return(body: fixture('achievement/achievement.json'))
      achievement = @client.achievement(2144)
      expect(achievement.id).to eq 2144
    end
  end
end
