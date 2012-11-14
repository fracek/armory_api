require 'armory_api/client'

module ArmoryApi
  class << self
    # Shortcut for ArmoryApi::Client.new
    #
    # @return [ArmoryApi::Client]
    def new(options={})
      ArmoryApi::Client.new(options)
    end
  end
end
