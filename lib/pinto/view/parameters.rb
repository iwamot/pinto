module Pinto
  class View
    class Parameters
      def initialize
        @parameters = {}
      end

      def set(symbol, value)
        unless symbol.is_a? Symbol
          raise TypeError.new('symbol must be Symbol')
        end

        @parameters[symbol] = value
      end

      def to_hash
        return @parameters
      end
    end
  end
end
