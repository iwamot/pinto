module Pinto
  class OpenID
    class UserSuppliedID
      def initialize(user_supplied_id)
        unless user_supplied_id.respond_to? :to_s
          raise TypeError.new('user_supplied_id must respond to #to_s')
        end

        @user_supplied_id = user_supplied_id.to_s
      end

      def to_s
        return @user_supplied_id
      end
    end
  end
end
