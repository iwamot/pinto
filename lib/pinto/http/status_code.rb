module Pinto
  module HTTP
    class StatusCode
      def initialize(status_code)
        @status_code = status_code.to_i
      end

      def to_i
        return @status_code
      end
    end
  end
end
