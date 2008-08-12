module Pinto
  module Controller
    class Name
      def initialize(controller_name)
        unless controller_name.respond_to? :to_s
          raise TypeError.new('controller_name must respond to #to_s')
        end

        @controller_name = controller_name.to_s
      end

      def to_s
        return @controller_name
      end

      def ==(other)
        other = Pinto::Controller::Name.new(other)
        return (self.to_s == other.to_s)
      end
    end
  end
end
