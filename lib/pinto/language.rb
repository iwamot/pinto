# lib/pinto/language.rb

require 'pinto/config'
require 'pinto/helper/translate'

module Pinto
  class Language
    def self.list(display_lang = 'en')
      translator = Class.new
      translator.extend Pinto::Helper::Translate
      translator.lang = display_lang

      return [
        {'code' => 'en', 'name' => translator._('English')},
        {'code' => 'ja', 'name' => translator._('Japanese')}
      ]
    end

    def self.get_other(except_lang)
      return self.list(except_lang).delete_if do |lang|
        lang['code'] == except_lang
      end
    end
  end
end