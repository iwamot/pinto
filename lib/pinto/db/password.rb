# lib/pinto/db/password.rb
module Pinto
  module DB
    class Password
      def initialize(password)
        unless password.is_a? String
          raise ArgumentError.new('password must be String')
        end
        @password = password
      end

      def to_s
        return @password
      end
    end
  end
end
