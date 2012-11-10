require 'armory_api/default'

module ArmoryApi
  module Configurable
    attr_writer :region, :locale
    attr_accessor :region, :locale

    class << self

      def keys
        @keys ||= [
          :region,
          :locale
        ]
      end
    end

    def configure
      yield self
      self
    end

    def reset!
      ArmoryApi::Configurable.keys.each do |k|
        instance_variable_set(:"@#{k}", ArmoryApi::Default.options[k])
      end
      self
    end
    alias setup reset!
  end
end
