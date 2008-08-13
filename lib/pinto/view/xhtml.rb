module Pinto
  class View
    class XHTML < Erubis::EscapedEruby
      def evaluate(view_parameters)
        context = Pinto::View::Context.new(view_parameters)
        if view_parameters.has_key? :locale_code
          context.locale_code = view_parameters[:locale_code]
        end
        super(context)
      end

      def escaped_expr(code)
        "h(#{code})"
      end
    end
  end
end
