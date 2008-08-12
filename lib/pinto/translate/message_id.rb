module Pinto
  module Translate
    class MessageID
      def initialize(message_id)
        @message_id = message_id.to_s
      end

      def to_s
        return @message_id
      end
    end
  end
end
