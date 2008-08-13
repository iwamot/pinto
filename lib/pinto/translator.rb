module Pinto
  class Translator
    def initialize(locale_code = 'en')
      @translator = Class.new
      @translator.extend(Pinto::Helper::Translator)
      @translator.locale_code = locale_code
    end

    def _(message_id)
      @translator._(message_id)
    end
  end
end
