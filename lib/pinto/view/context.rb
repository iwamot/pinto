module Pinto
  class View
    class Context < Erubis::Context
      include Pinto::Helper::HTML::Escaper
      include Pinto::Helper::URI
      include Pinto::Helper::Translator

      alias h    escape_value
      alias attr escape_attribute
      alias tag  escape_tag

      def initialize(view_parameters)
        super
      end
    end
  end
end
