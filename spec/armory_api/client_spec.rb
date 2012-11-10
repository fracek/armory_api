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
        locale: 'en_GB'
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
  end
end
