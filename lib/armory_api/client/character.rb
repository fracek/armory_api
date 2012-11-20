module ArmoryApi
  class Client
    module Character

      # Retrieves a character from the Armory
      #
      # @param [String] name
      # @param [String] realm
      # @param [Array] fields optional fields, a list can be found on the
      #  [official page](http://blizzard.github.com/api-wow-docs/#character-profile-api)
      # @return [Hash] the character hash
      def character(name, realm=nil, fields=[])
        if realm.class == Array
          fields = realm
          realm = nil
        end
        realm ||= @realm
        raise ArmoryApi::RealmNotFound if realm.nil?
        fields ||= []
        params = { fields: fields.join(',') } unless fields.empty?
        get("/api/wow/character/#{realm}/#{name}", params)
      end
    end
  end
end
