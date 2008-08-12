module Pinto
  class Locale
    class Code
      def initialize(code)
        unless code.respond_to? :to_s
          raise TypeError.new('code must respond to #to_s')
        end

        @code = code.to_s
      end

      def to_s
        return @code
      end

      def ==(other)
        other = Pinto::Locale::Code.new(other)
        return (self.to_s == other.to_s)
      end
    end
  end
end
