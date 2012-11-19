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

    # Delegate to ArmoryApi::Client.new
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end

ArmoryApi.reset
