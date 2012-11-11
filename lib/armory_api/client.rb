require 'armory_api/api'
require 'armory_api/configurable'
require 'uri'

module ArmoryApi
  class Client
    include ArmoryApi::API
    include ArmoryApi::Configurable

    # Initializes a new Client object
    #
    # @param [Hash] options
    # @return [ArmoryApi::Client]
    def initialize(options={})
      ArmoryApi::Configurable.keys.each do |k|
        instance_variable_set(:"@#{k}",
                      options[k] || ArmoryApi.instance_variable_get(:"@#{k}"))
      end
    end

    # Perform an HTTP GET request
    def get(path, params={}, options={})
      request(:get, path, params, options)
    end
   private

    def connection
      @connection ||= Faraday.new(endpoint, @connection_options.merge(builder: @middleware))
    end

    def request(method, path, params={}, options={})
      uri = options[:endpoint] || endpoint
      uri = URI(uri) unless uri.respond_to?(:host)
      uri += path
      request_headers = {}
      connection.url_prefix = options[:endpoint] || endpoint
      response = connection.run_request(method.to_sym, path, nil, request_headers) do |req|
        unless params.empty?
          case req.method
          when :post, :put
            req.body = params
          else
            req.params.update(params)
          end
        end
        yield req if block_given?
      end.env
      response
    end
  end
end
