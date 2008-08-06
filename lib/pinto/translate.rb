# lib/pinto/translate.rb

module Pinto
  class Translate
    def initialize(lang)
      unless lang.is_a? Pinto::Language::Code
        raise ArgumentError.new('lang must be Pinto::Language::Code')
      end

      @translator = Class.new
      @translator.extend(Pinto::Helper::Translate)
      @translator.set_language(lang)
    end

    def _(message_id)
      unless message_id.is_a? String
        raise ArgumentError.new('message_id must be String')
      end

      return @translator._(message_id)
    end
  end
end
