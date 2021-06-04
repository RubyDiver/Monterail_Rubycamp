module Users
  module Representers
    class OneUser
      attr_reader :user

      def initialize(user)
        @user = user
      end

      def basic
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


