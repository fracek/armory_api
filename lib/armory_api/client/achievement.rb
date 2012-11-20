module ArmoryApi
  class Client
    module Achievement

      # Retrieves the achievement `id` from the Armory
      #
      # @param [Integer] id the achievement id
      # @return [Hash] the achievement
      def achievement(id)
        get("/api/wow/achievement/#{id}")
      end
    end
  end
end
