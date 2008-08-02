# lib/pinto/uri/expand_processor.rb

module Pinto
  module URI
    class ExpandProcessor
      def self.transform(name, value)
        unless name.is_a? String
          raise ArgumentError.new('name must be String')
        end
        unless value.is_a? String
          raise ArgumentError.new('value must be String')
        end

        return value + '.' if name == 'lang'
        return '?' + value if name == 'query'
        return value
      end
    end
  end
end
