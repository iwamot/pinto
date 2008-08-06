# lib/pinto/type/view_param.rb
module Pinto
  module Type
    class ViewParam
      def initialize(view_param)
        unless view_param.is_a? Hash
          raise ArgumentError.new('view_param must be Hash')
        end
        @view_param = view_param
      end

      def to_hash
        return @view_param
      end
    end
  end
end
