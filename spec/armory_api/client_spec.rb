require 'helper'

describe ArmoryApi::Client do
  context "with module configuration" do
    before do
      ArmoryApi.configure do |config|
        ArmoryApi::Configurable.keys.each do |k|
          config.send("#{k}=", k)
        end
      end
    end

    after do
      ArmoryApi.reset!
    end

    it "inherits the module configuration" do
      client = ArmoryApi::Client.new
      ArmoryApi::Configurable.keys.each do |k|
        expect(client.instance_variable_get(:"@#{k}")).to eq k
      end
    end
  end

  context "with class configuration" do
    before do
      @conf = {
        region: 'eu',
        locale: 'en_GB',
        connection_options: { timeout: 0 },
        middleware: Proc.new{}
      }
    end

    context "during initialization" do
      it "overrides the module configuration" do
        client = ArmoryApi::Client.new(@conf)
        ArmoryApi::Configurable.keys.each do |k|
          expect(client.instance_variable_get(:"@#{k}")).to eq @conf[k]
        end
      end
    end

    context "after initialization" do
      it "overrides the module configuration" do
        client = ArmoryApi::Client.new
        client.configure do |config|
          @conf.each do |k, v|
            config.send("#{k}=", v)
          end
        end
        ArmoryApi::Configurable.keys.each do |k|
          expect(client.instance_variable_get(:"@#{k}")).to eq @conf[k]
        end
      end
    end
  end

  describe "#connection" do
    it "looks like faraday connection" do
      client = ArmoryApi::Client.new
      conn = client.send(:connection)
      expect(conn).to respond_to(:run_request)
    end
  end

  describe "#request" do
    # TODO
  end
end
