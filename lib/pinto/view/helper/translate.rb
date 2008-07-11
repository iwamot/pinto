# lib/pinto/view/helper/translate.rb

require 'gettext'

module Pinto
  class View
    class Helper
      module Translate
        attr_accessor :lang

        def _(value)
          GetText.set_output_charset('UTF-8')
          GetText.bindtextdomain('pinto', {:path => '../../locale'})
          GetText.set_locale(@lang)
          return GetText._(value)
        end
      end
    end
  end
end
