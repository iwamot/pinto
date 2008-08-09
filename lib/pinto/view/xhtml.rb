# lib/pinto/view/xhtml.rb
module Pinto
  class View
    class XHTML < Erubis::EscapedEruby
      def escaped_expr(code)
        unless code.is_a? String
          raise ArgumentError.new('code must be String')
        end
        return "h(#{code})"
      end

      def evaluate(param)
        unless param.is_a? Pinto::Type::ViewParam
          raise ArgumentError.new('param must be Pinto::Type::ViewParam')
        end

        context = Pinto::View::Context.new(param)
        if param.to_hash.has_key? :lang
          language = Pinto::Language::Code.new(param.to_hash[:lang])
          context.set_language(language)
        end

        super(context)
      end
    end
  end
end
