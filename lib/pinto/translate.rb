# lib/pinto/translate.rb

require 'pinto/helper/translate'

module Pinto
  class Translate
    attr_accessor :translator

    def initialize(lang)
      @translator = Class.new
      @translator.extend(Pinto::Helper::Translate)
      @translator.lang = lang
    end

    def _(message_id)
      return @translator._(message_id)
    end
  end
end
