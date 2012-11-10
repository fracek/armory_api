module ArmoryApi
  module Default
    REGION = 'us'
    LOCALE = 'en_US'

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
    end
  end
end
