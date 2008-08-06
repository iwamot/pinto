# lib/pinto/type/controller_name.rb
module Pinto
  module Type
    class ControllerName
      def initialize(controller_name)
        unless controller_name.is_a? String
          raise ArgumentError.new('controller_name must be String')
        end
        @controller_name = controller_name
      end

      def to_s
        return @controller_name
      end
    end
  end
end
