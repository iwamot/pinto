module Pinto
  module Helper
    module Translator
      attr_accessor :locale_code

      def _(message_id)
        @locale_code ||= 'en'

        GetText.set_output_charset('UTF-8')
        GetText.bindtextdomain('pinto', :path => 'locale')
        GetText.set_locale(@locale_code)
        GetText._(message_id)
      end
    end
  end
end
