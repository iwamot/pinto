# lib/pinto/type/language.rb

module Pinto
  module Type
    class Language
      def initialize(language)
        unless language.is_a? String
          raise ArgumentError.new('language must be String')
        end

        @language = language
      end

      def to_s
        return @language
      end
    end
  end
end
