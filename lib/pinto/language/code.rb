# lib/pinto/language/code.rb

module Pinto
  class Language
    class Code
      def initialize(code)
        unless code.is_a? String
          raise ArgumentError.new('code must be String')
        end

        @code = code
      end

      def to_s
        return @code
      end

      def ==(other)
        return self.to_s == other.to_s
      end
    end
  end
end
