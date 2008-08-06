# lib/pinto/type/user_supplied_id.rb
module Pinto
  module Type
    class UserSuppliedID
      def initialize(user_supplied_id)
        unless user_supplied_id.is_a? String
          raise ArgumentError.new('user_supplied_id must be String')
        end
        @user_supplied_id = user_supplied_id
      end

      def to_s
        return @user_supplied_id
      end
    end
  end
end
