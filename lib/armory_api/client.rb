require 'faraday'
require 'uri'

require 'armory_api/client/achievement'
require 'armory_api/client/character'
require 'armory_api/client/item'
require 'armory_api/client/pvp'

module ArmoryApi
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    # Initializes a new Client object
    #
    # @param [Hash] options
    # @return [ArmoryApi::Client]
    def initialize(options={})
      options = ArmoryApi.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    # Performs an HTTP GET request
    def get(path, params={}, options={})
      request(:get, path, params, options)
    end

    include ArmoryApi::Client::Achievement
    include ArmoryApi::Client::Character
    include ArmoryApi::Client::Item
    include ArmoryApi::Client::Pvp
   private
    def endpoint
      "http://#{@region}.battle.net"
    end

    # TODO: don't make a new connection on each request
    def connection
      @connection = Faraday.new(endpoint,
                                @connection_options.merge(builder: @middleware))
    end

    def request(method, path, params={}, options={})
      uri = options[:endpoint] || endpoint
      uri = URI(uri) unless uri.respond_to?(:host)
      uri += path
      request_headers = {}
      params ||= {}
      connection.url_prefix = options[:endpoint] || endpoint
      res = connection.run_request(method.to_sym, path, nil, request_headers) do |req|
        unless params.empty?
          case req.method
          when :post, :put
            req.body = params
          else
            req.params.update(params)
          end
        end
      end
      res.body
    end
  end
end
