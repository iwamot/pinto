module Pinto
  class View
    class XHTML < Erubis::EscapedEruby
      def evaluate(view_parameters)
        unless view_parameters.is_a? Pinto::View::Parameters
          raise TypeError.new(
            'view_parameters must be Pinto::View::Parameters'
          )
        end

        context = Pinto::View::Context.new(view_parameters)
        if view_parameters.to_hash.has_key? :locale_code
          locale_code = Pinto::Locale::Code.new(
            view_parameters.to_hash[:locale_code]
          )
          context.locale_code = locale_code
        end

        super(context)
      end

      def escaped_expr(code)
        unless code.is_a? String
          raise TypeError.new('code must be String')
        end

        return "h(#{code})"
      end
    end
  end
end
