module Api
  module Soap
    class UsersController < ApplicationController
      soap_service namespace: 'urn:users'

      soap_action "get_users",
                  args: nil,
                  return: [ { id: :integer, name: :string }]
      def get_users
        render soap: User.all.map { |u| { id: u.id, name: u.name }}
      end
    end
  end
end

