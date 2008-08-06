# lib/pinto/type/query_strings.rb
module Pinto
  module Type
    class QueryStrings
      def initialize(query_strings)
        unless query_strings.is_a? Hash
          raise ArgumentError.new('query_strings must be Hash')
        end
        @query_strings = query_strings
      end

      def to_hash
        return @query_strings
      end
    end
  end
end
