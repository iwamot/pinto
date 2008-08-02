# lib/pinto/language.rb

module Pinto
  class Language
    def self.list(lang = Pinto::Type::Language.new('en'))
      unless lang.is_a? Pinto::Type::Language
        raise ArgumentError.new('lang must be Pinto::Type::Language')
      end

      translator = Pinto::Translate.new(lang)
      return [
        {'code' => 'en', 'name' => translator._('English')},
        {'code' => 'ja', 'name' => translator._('Japanese')}
      ]
    end

    def self.get_other(base_lang)
      unless base_lang.is_a? Pinto::Type::Language
        raise ArgumentError.new('base_lang must be Pinto::Type::Language')
      end

      return self.list(base_lang).delete_if do |lang|
        lang['code'] == base_lang.to_s
      end
    end
  end
end
