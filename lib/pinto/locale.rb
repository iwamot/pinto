# lib/pinto/locale.rb
module Pinto
  class Locale
    LIST = ['en', 'ja']

    def self.list
      return LIST.map do |locale|
        Pinto::Locale.new(locale)
      end
    end

    def initialize(locale)
      unless locale.is_a? String
        raise ArgumentError.new('locale must be String')
      end

      @locale = locale
    end

    def others
      return Pinto::Locale.list.delete_if do |locale|
        locale == self
      end
    end

    def to_s
      return @locale
    end

    def name(translator)
      unless translator.respond_to? '_'
        raise ArgumentError.new('translator must have "_" method')
      end

      case self.to_s
      when 'en'
        return translator._('English')
      when 'ja'
        return translator._('Japanese')
      end
    end

    def ==(other)
      return (self.to_s == other.to_s)
    end
  end
end
