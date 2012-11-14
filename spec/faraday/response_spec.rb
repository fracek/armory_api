require 'helper'

describe Faraday::Response do
  before do
    @client = ArmoryApi::Client.new
  end

  {
    404 => ArmoryApi::NotFound,
    500 => ArmoryApi::InternalServerError
  }.each do |status, exception|
    context "when HTTP status is #{status}" do
      before do
        stub_request(:get, 'http://us.battle.net/api/wow/character/realm/name')
          .to_return(status: status,
                     body: '{"status":"nok", "reason": "When in doubt, blow it up. (page not found)"}')
      end

      it "raises #{exception.name} error" do
        expect{@client.character('name', 'realm')}.to raise_exception(exception)
      end
    end
  end
end
