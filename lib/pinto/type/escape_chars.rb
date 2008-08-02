# lib/pinto/type/escape_chars.rb

module Pinto
  module Type
    class EscapeChars
      def initialize(escape_chars)
        unless escape_chars.is_a? Array
          raise ArgumentError.new('escape_chars must be Array')
        end

        @escape_chars = escape_chars
      end

      def to_a
        return @escape_chars
      end
    end
  end
end
