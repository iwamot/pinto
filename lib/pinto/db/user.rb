# lib/pinto/db/user.rb

module Pinto
  module DB
    class User
      def initialize(user)
        unless user.is_a? String
          raise ArgumentError.new('user must be String')
        end

        @user = user
      end

      def to_s
        return @user
      end
    end
  end
end
