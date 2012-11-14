require 'helper'

describe ArmoryApi do
  describe ".new" do
    it "is an ArmoryApi::Client" do
      expect(ArmoryApi.new).to be_a ArmoryApi::Client
    end
  end

  describe ".configure" do
    ArmoryApi.options.keys.each do |key|
      it "sets the #{key.to_s.gsub('_', ' ')}" do
        ArmoryApi.configure do |conf|
          conf.send("#{key}=", key)
        end
        expect(ArmoryApi.instance_variable_get(:"@#{key}")).to eq key
      end
    end
  end
end
