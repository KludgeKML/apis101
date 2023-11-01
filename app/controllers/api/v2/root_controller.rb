module Api
  module V2
    class RootController < Api::V2::BaseController
      def index
        render json: base_roots
      end

      private

        def base_roots
          {
            description: "ReSTful API to access User controls",
            _links: {
              users: { href: api_v2_users_url },
              groups: { href: api_v2_groups_url },
              tokens: { href: api_v2_tokens_url },
            }
          }
        end
    end
  end
end