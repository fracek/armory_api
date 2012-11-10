require 'armory_api/client'
require 'armory_api/configurable'

module ArmoryApi
  class << self
    include ArmoryApi::Configurable

    def client
      @client = ArmoryApi::Client.new unless defined?(@client)
      @client
    end
  end
end

ArmoryApi.setup
