# lib/pinto/view/xhtml.rb

require 'erubis'
require 'pinto/view/helper/html'
require 'pinto/view/helper/uri'

module Pinto
  class View
    class XHTML < Erubis::EscapedEruby
      def escaped_expr(code)
        return "h(#{code})"
      end

      def evaluate(param)
        context = Erubis::Context.new(param)
        context.extend Pinto::View::Helper::HTML
        context.extend Pinto::View::Helper::URI
        super context
      end
    end
  end
end
