require 'armory_api/configuration'
require 'armory_api/client'
require 'armory_api/error'

module ArmoryApi
  extend Configuration
  class << self
    # Shortcut for ArmoryApi::Client.new
    #
    # @return [ArmoryApi::Client]
    def new(options={})
      ArmoryApi::Client.new(options)
    end
  end
end

ArmoryApi.reset
