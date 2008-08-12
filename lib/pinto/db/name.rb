module Pinto
  module DB
    class Name
      def initialize(name)
        unless name.respond_to? :to_s
          raise TypeError.new('name must respond to #to_s')
        end

        @name = name.to_s
      end

      def to_s
        return @name
      end
    end
  end
end
