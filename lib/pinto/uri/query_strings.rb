module Pinto
  class URI
    class QueryStrings
      def initialize(query_strings)
        @query_strings = query_strings.to_hash
      end

      def to_hash
        return @query_strings
      end
    end
  end
end
