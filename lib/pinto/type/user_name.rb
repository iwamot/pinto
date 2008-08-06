# lib/pinto/type/user_name.rb
module Pinto
  module Type
    class UserName
      def initialize(user_name)
        unless user_name.is_a? String
          raise ArgumentError.new('user_name must be String')
        end
        @user_name = user_name
      end

      def to_s
        return @user_name
      end
    end
  end
end
