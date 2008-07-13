# lib/pinto/view/xhtml.rb

require 'erubis'
require 'pinto/helper/html'
require 'pinto/helper/translate'
require 'pinto/helper/uri'

module Pinto
  class View
    class XHTML < Erubis::EscapedEruby
      def escaped_expr(code)
        return "h(#{code})"
      end

      def evaluate(param)
        context = Erubis::Context.new(param)
        context.extend Pinto::Helper::HTML
        context.extend Pinto::Helper::URI

        if param.has_key? :lang
          context.extend Pinto::Helper::Translate
          context.lang = param[:lang]
        end

        super context
      end
    end
  end
end
