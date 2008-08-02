# lib/pinto/type/view_name.rb

module Pinto
  module Type
    class ViewName
      def initialize(view_name)
        unless view_name.is_a? String
          raise ArgumentError.new('view_name must be String')
        end

        @view_name = view_name
      end

      def to_s
        return @view_name
      end
    end
  end
end
