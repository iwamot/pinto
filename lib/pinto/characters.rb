module Pinto
  class Characters
    def initialize(characters)
      unless characters.respond_to? :to_a
        raise TypeError.new('characters must respond to #to_a')
      end

      @characters = characters.to_a
    end

    def to_a
      return @characters
    end
  end
end
