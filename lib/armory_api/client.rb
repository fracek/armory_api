require 'armory_api/configurable'

module ArmoryApi
  class Client
    include ArmoryApi::Configurable

    # Initializes a new Client object
    #
    # @param [Hash] options
    # @return [ArmoryApi::Client]
    def initialize(options={})
      ArmoryApi::Configurable.keys.each do |k|
        instance_variable_set(:"@#{k}",
                      options[k] || ArmoryApi.instance_variable_get(:"@#{k}"))
      end
    end
  end
end
