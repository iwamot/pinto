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
        unless view_parameters.is_a? Pinto::View::Parameters
          raise TypeError.new(
            'view_parameters must be Pinto::View::Parameters'
          )
        end

        super(view_parameters.to_hash)
      end
    end
  end
end
