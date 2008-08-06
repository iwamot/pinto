# lib/pinto/language/name.rb

module Pinto
  class Language
    class Name
        def initialize(name)
        unless name.is_a? String
          raise ArgumentError.new('name must be String')
        end

        @name = name
      end

      def to_s
        return @name
      end

      def ==(other)
        return self.to_s == other.to_s
      end
    end
  end
end
