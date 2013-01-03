require 'faraday'

# @api private
module Faraday
  class Response::RaiseArmoryApiError < Response::Middleware
    def on_complete(res)
      case res[:status].to_i
      when 404
        raise ArmoryApi::NotFound, error_message(res)
      when 500
        raise ArmoryApi::InternalServerError, error_message(res)
      end
    end

    def error_message(res)
      "#{res[:method].to_s.upcase} #{res[:url].to_s}: #{res[:body]["reason"]}"
    end
  end
end
