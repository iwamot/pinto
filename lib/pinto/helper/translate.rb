# lib/pinto/view/translate.rb

module Pinto
  module Helper
    module Translate
      attr_accessor :lang

      def _(message_id)
        @lang = 'en' if @lang.nil? || @lang.empty?

        GetText.set_output_charset('UTF-8')
        GetText.bindtextdomain('pinto', {:path => 'locale'})
        GetText.set_locale(@lang)
        return GetText._(message_id)
      end
    end
  end
end
