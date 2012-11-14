require 'faraday'
require 'faraday_middleware'
require 'faraday/response/raise_armory_api_error'
require 'armory_api/version'

module ArmoryApi
  module Configuration
    VALID_OPTIONS_KEYS = [
      :region,
      :locale,
      :realm,
      :endpoint,
      :user_agent,
      :connection_options,
      :middleware
    ].freeze

    DEFAULT_REGION     = 'us'
    DEFAULT_LOCALE     = 'en_US'
    DEFAULT_ENDPOINT   = "http://#{DEFAULT_REGION}.battle.net"
    DEFAULT_USER_AGENT = "ArmoryApi Ruby Gem #{ArmoryApi::VERSION}".freeze
    DEFAULT_CONNECTION_OPTIONS = {
      headers: {
        accept: 'application/json',
        user_agent: DEFAULT_USER_AGENT
      },
      raw: true
    }
    DEFAULT_MIDDLEWARE = Faraday::Builder.new do |builder|
      builder.request :json

      builder.use Faraday::Response::RaiseArmoryApiError
      builder.use FaradayMiddleware::Mashify
      builder.use FaradayMiddleware::ParseJson

      builder.adapter Faraday.default_adapter
    end

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def reset
      self.region     = DEFAULT_REGION
      self.locale     = DEFAULT_LOCALE
      self.realm      = nil
      self.endpoint   = DEFAULT_ENDPOINT
      self.user_agent = DEFAULT_USER_AGENT
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
      self.middleware = DEFAULT_MIDDLEWARE
    end
  end
end
