# lib/pinto/db/name.rb
module Pinto
  module DB
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
    end
  end
end
