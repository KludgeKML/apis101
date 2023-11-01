module Api
  module V2
    class TokensController < Api::V2::BaseController
      def new_token
        render json: new_token_hash
      end
  
      private
  
      def new_token_hash
        payload = { source: "APIs 101 - POST /api/v2/token" }
        {
          description: "Token generated at #{Time.zone.now}",
          jwt: JWT.encode(payload, hmac_secret, "HS256"),
        }
      end
    end
  end
end
