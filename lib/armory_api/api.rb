module ArmoryApi
  module API

    def character(realm, name, options={})
      get("/api/wow/character/#{realm}/#{name}")
    end
  end
end
