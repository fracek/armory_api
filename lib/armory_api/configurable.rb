require 'armory_api/default'

module ArmoryApi
  module Configurable
    attr_writer :region, :locale
    attr_accessor :region, :locale, :endpoint, :connection_options, :middleware

    class << self

      def keys
        @keys ||= [
          :region,
          :locale,
          :connection_options,
          :middleware
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

    def endpoint
      if region == 'cn'
        "www.battlenet.com.cn"
      else
        "http://#{region}.battle.net"
      end
    end
  end
end
