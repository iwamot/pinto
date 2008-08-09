# lib/pinto/translator.rb
module Pinto
  class Translator
    def initialize(locale)
      unless locale.is_a? Pinto::Locale
        raise ArgumentError.new('locale must be Pinto::Locale')
      end

      @translator = Class.new
      @translator.extend(Pinto::Helper::Translator)
      @translator.locale = locale
    end

    def _(message_id)
      unless message_id.is_a? String
        raise ArgumentError.new('message_id must be String')
      end

      return @translator._(message_id)
    end
  end
end
