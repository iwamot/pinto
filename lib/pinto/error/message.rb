module Pinto
  module Error
    class Message
      def initialize(error_message)
        unless error_message.respond_to? :to_s
          raise TypeError.new('error_message must respond to #to_s')
        end

        @error_message = error_message.to_s
      end

      def to_s
        return @error_message
      end
    end
  end
end
