module Pinto
  class Translator
    def initialize(locale_code = 'en')
      locale_code = Pinto::Locale::Code.new(locale_code)

      @translator = Class.new
      @translator.extend(Pinto::Helper::Translator)
      @translator.locale_code = locale_code
    end

    def _(message_id)
      message_id = Pinto::Translate::MessageID.new(message_id)

      return @translator._(message_id.to_s)
    end
  end
end
