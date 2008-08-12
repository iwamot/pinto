module Pinto
  module DB
    class Password
      def initialize(password)
        unless password.respond_to? :to_s
          raise TypeError.new('password must respond to #to_s')
        end

        @password = password.to_s
      end

      def to_s
        return @password
      end

      alias to_str to_s
    end
  end
end
