# lib/pinto/type/http_status_code.rb
module Pinto
  module Type
    class HttpStatusCode
      def initialize(http_status_code)
        unless http_status_code.is_a? Integer
          raise ArgumentError.new('http_status_code must be Integer')
        end
        @http_status_code = http_status_code
      end

      def to_i
        return @http_status_code
      end
    end
  end
end
