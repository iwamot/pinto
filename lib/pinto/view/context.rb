# lib/pinto/view/context.rb
module Pinto
  class View
    class Context < Erubis::Context
      include Pinto::Helper::HTML::Escaper
      include Pinto::Helper::URI
      include Pinto::Helper::Translator

      alias h    escape_value
      alias attr escape_attribute
      alias tag  escape_tag

      def initialize(param)
        unless param.is_a? Pinto::Type::ViewParam
          raise ArgumentError.new('param must be Pinto::Type::ViewParam')
        end

        super(param.to_hash)
      end
    end
  end
end
