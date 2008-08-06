# lib/pinto/type/uri_map.rb
module Pinto
  module Type
    class UriMap
      def initialize(uri_map)
        unless uri_map.is_a? Hash
          raise ArgumentError.new('uri_map must be Hash')
        end
        @uri_map = uri_map
      end

      def to_hash
        return @uri_map
      end
    end
  end
end
