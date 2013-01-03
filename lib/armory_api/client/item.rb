module ArmoryApi
  class Client
    module Item

      # Retrieve an item
      #
      # @param [Integer] id the item id
      # @return [Hash] the item
      def item(id)
        get("/api/wow/item/#{id}")
      end

      # Retrieve an item set.  
      # If full is set to true ArmoryApi will retrieve each item of the set.
      #
      # @param [Integer] id the set id
      # @param [Boolean] full also retrieve each item of the set
      # @return [Hash] the item set
      def item_set(id, full=false)
        res = get("/api/wow/item/set/#{id}")
        if full
          res.items.map! {|i| item(i)}
        end
        res
      end
    end
  end
end
