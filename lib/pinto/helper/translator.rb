# lib/pinto/view/translator.rb
module Pinto
  module Helper
    module Translator
      def locale=(locale)
        unless locale.is_a? Pinto::Locale
          raise ArgumentError.new('locale must be Pinto::Locale')
        end

        @locale = locale
      end

      def locale
        return @locale
      end

      def _(message_id)
        unless message_id.is_a? String
          raise ArgumentError.new('message_id must be String')
        end

        @locale = Pinto::Locale.new('en') if @locale.nil?

        GetText.set_output_charset('UTF-8')
        GetText.bindtextdomain('pinto', {:path => 'locale'})
        GetText.set_locale(@locale.to_s)
        return GetText._(message_id)
      end
    end
  end
end
