# lib/pinto/view/translate.rb
module Pinto
  module Helper
    module Translate
      def set_language(language)
        unless language.is_a? Pinto::Language::Code
          raise ArgumentError.new('language must be Pinto::Language::Code')
        end
        @language = language
      end

      def get_language
        return @language
      end

      def _(message_id)
        unless message_id.is_a? String
          raise ArgumentError.new('message_id must be String')
        end

        @language = Pinto::Language::Code.new('en') if @language.nil?

        GetText.set_output_charset('UTF-8')
        GetText.bindtextdomain('pinto', {:path => 'locale'})
        GetText.set_locale(@language.to_s)
        return GetText._(message_id.to_s)
      end
    end
  end
end
