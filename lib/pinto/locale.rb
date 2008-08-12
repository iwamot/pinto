module Pinto
  class Locale
    def self.list
      translator = Pinto::Translator.new
      return [
        Pinto::Locale.new(Pinto::Locale::Code.new('en'),
                          translator._('English')),
        Pinto::Locale.new(Pinto::Locale::Code.new('ja'),
                          translator._('Japanese')),
      ]
    end

    def initialize(code, name)
      self.code = code
      self.name = name
    end

    def self.others(locale_code)
      locale_code = Pinto::Locale::Code.new(locale_code)
      return Pinto::Locale.list.delete_if do |locale|
        locale.code == locale_code
      end
    end

    def code=(code)
      @code = Pinto::Locale::Code.new(code)
    end

    def code
      return @code
    end

    def name=(name)
      unless name.respond_to? :to_s
        raise TypeError.new('name must respond to #to_s')
      end

      @name = name.to_s
    end

    def name
      return @name
    end

    def ==(other)
      return (self.code == other.code && self.name == other.name)
    end
  end
end
