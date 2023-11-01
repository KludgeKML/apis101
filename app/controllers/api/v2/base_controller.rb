module Api
  module V2
    class BaseController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods

      def hmac_secret
        ENV["V2_TOKEN_SECRET"]
      end

      def authenticate
        authenticate_or_request_with_http_token do |token, _|
          begin
            JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
            true
          rescue JWT::ExpiredSignature
            false
          end
        end
      end      
    end
  end
end