require 'faraday'
require 'armory_api/version'

module ArmoryApi
  module Default
    REGION = 'us' unless defined? REGION
    LOCALE = 'en_US' unless defined? LOCALE
    CONNECTION_OPTIONS = {
      headers: {
        user_agent: "ArmoryApi Ruby Gem (#{ArmoryApi::Version})"
      },
      raw: true,
      timeout: 10
    } unless defined? CONNECTION_OPTIONS
    MIDDLEWARE = Faraday::Builder.new(
      &Proc.new do |builder|
        builder.adapter Faraday.default_adapter
      end
    )

    class << self

      # @return [Hash]
      def options
        Hash[ArmoryApi::Configurable.keys.each.map{|k| [k, send(k)]}]
      end

      def region
        REGION
      end

      def locale
        LOCALE
      end

      def connection_options
        CONNECTION_OPTIONS
      end

      def middleware
        MIDDLEWARE
      end
    end
  end
end
