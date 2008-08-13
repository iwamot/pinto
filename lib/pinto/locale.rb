module Pinto
  class Locale
    attr_reader :code, :name

    def self.list
      translator = Pinto::Translator.new
      [
        Pinto::Locale.new('en', translator._('English')),
        Pinto::Locale.new('ja', translator._('Japanese')),
      ]
    end

    def self.code_list
      self.list.map do |locale|
        locale.code
      end
    end

    def initialize(code, name)
      @code = code
      @name = name
    end

    def self.others(locale_code)
      self.list.delete_if do |locale|
        locale.code == locale_code
      end
    end

    def ==(other)
      self.code == other.code && self.name == other.name
    end
  end
end
