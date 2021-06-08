# frozen_string_literal: true

module Users
  module Representers
    class AllUsers
      attr_reader :users

      def initialize(users)
        @users = users
      end

      def basic
        users.map do |user|
          {
            id: user.id,
            name: users.name,
            age: user.age,
            email: user.email,
            real_user: user.real_user
          }
        end
      end
    end
  end
end
