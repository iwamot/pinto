module Pinto
  module DB
    class User
      def initialize(user)
        unless user.respond_to? :to_s
          raise TypeError.new('user must respond to #to_s')
        end

        @user = user.to_s
      end

      def to_s
        return @user
      end

      alias to_str to_s
    end
  end
end
