# lib/pinto/type/uri.rb
module Pinto
  module Type
    class URI
      def initialize(uri)
        unless uri.is_a? String
          raise ArgumentError.new('uri must be String')
        end
        @uri = uri
      end

      def to_s
        return @uri
      end
    end
  end
end
