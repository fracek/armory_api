require 'armory_api/version'

module ArmoryApi
  module Configuration
    VALID_OPTIONS_KEYS = [
      :region,
      :locale,
      :realm,
      :user_agent
    ].freeze

    DEFAULT_REGION     = 'us'
    DEFAULT_LOCALE     = 'en_US'
    DEFAULT_USER_AGENT = "ArmoryApi Ruby Gem #{ArmoryApi::VERSION}".freeze

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
      self.user_agent = DEFAULT_USER_AGENT
    end
  end
end
