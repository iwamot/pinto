module Pinto
  class URI
    class ExpandProcessor
      def self.transform(name, value)
        unless name.is_a? String
          raise TypeError.new('name must be String')
        end
        unless value.respond_to? 'to_s'
          raise TypeError.new('value must respond to to_s')
        end

        value = value.to_s
        return value + '.' if name == 'locale_code'
        return '?' + value if name == 'query_string'
        return value
      end
    end
  end
end
