# lib/pinto/view/translate.rb

require 'gettext'

module Pinto
  module Helper
    module Translate
      attr_accessor :lang

      def _(value)
        GetText.set_output_charset('UTF-8')
        GetText.bindtextdomain('pinto', {:path => 'locale'})
        GetText.set_locale(@lang)
        return GetText._(value)
      end
    end
  end
end
