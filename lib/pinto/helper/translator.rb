module Pinto
  module Helper
    module Translator
      def locale_code=(locale_code)
        @locale_code = Pinto::Locale::Code.new(locale_code)
      end

      def locale_code
        return @locale_code
      end

      def _(message_id)
        message_id = Pinto::Translate::MessageID.new(message_id)

        self.locale_code = 'en' if self.locale_code.nil?

        GetText.set_output_charset('UTF-8')
        GetText.bindtextdomain('pinto', :path => 'locale')
        GetText.set_locale(self.locale_code.to_s)
        return GetText._(message_id.to_s)
      end
    end
  end
end
