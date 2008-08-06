# lib/pinto/language.rb
module Pinto
  class Language
    DEFAULT_LANGUAGE = 'en'
    def self.list(lang = Pinto::Language::Code.new(DEFAULT_LANGUAGE))
      unless lang.is_a? Pinto::Language::Code
        raise ArgumentError.new('lang must be Pinto::Language::Code')
      end

      translator = Pinto::Translate.new(lang)
      return [
        Pinto::Language.new(
          Pinto::Language::Code.new('en'),
          Pinto::Language::Name.new(translator._('English'))
        ),
        Pinto::Language.new(
          Pinto::Language::Code.new('ja'),
          Pinto::Language::Name.new(translator._('Japanese'))
        )
      ]
    end

    def self.others(base_lang)
      unless base_lang.is_a? Pinto::Language::Code
        raise ArgumentError.new('base_lang must be Pinto::Language::Code')
      end

      return self.list(base_lang).delete_if do |lang|
        lang.code.to_s == base_lang.to_s
      end
    end

    def initialize(code, name)
      unless code.is_a? Pinto::Language::Code
        raise ArgumentError.new('code must be Pinto::Language::Code')
      end
      unless name.is_a? Pinto::Language::Name
        raise ArgumentError.new('name must be Pinto::Language::Name')
      end

      @code = code
      @name = name
    end

    def code
      return @code
    end

    def name
      return @name
    end

    def ==(other)
      return (self.code == other.code && self.name == other.name)
    end
  end
end
