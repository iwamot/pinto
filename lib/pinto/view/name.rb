module Pinto
  class View
    class Name
      def initialize(view_name)
        unless view_name.respond_to? :to_s
          raise TypeError.new('view_name must be #to_s')
        end

        @view_name = view_name.to_s
      end

      def to_s
        return @view_name
      end

      def ==(other)
        other = Pinto::View::Name.new(other)

        return (self.to_s == other.to_s)
      end
    end
  end
end
