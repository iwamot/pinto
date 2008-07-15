# lib/pinto/language.rb

require 'pinto/config'

module Pinto
  class Language
    def self.get_other(except_lang)
      return Pinto::Config.load('languages').delete_if do |lang|
        lang['code'] == except_lang
      end
    end
  end
end
