require 'uri'

module ArmoryApi
  module API

    def character(realm, name, options={})
      get("/api/wow/character/#{realm}/#{URI.escape(name)}")
    end
  end
end
