# lib/pinto/type/error_message.rb

module Pinto
  module Type
    class ErrorMessage
      def initialize(error_message)
        unless error_message.is_a? String
          raise ArgumentError.new('error_message must be String')
        end

        @error_message = error_message
      end

      def to_s
        return @error_message
      end
    end
  end
end
