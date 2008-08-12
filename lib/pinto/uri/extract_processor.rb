module Pinto
  class URI
    class ExtractProcessor
      def self.match(name)
        unless name.is_a? String
          raise TypeError.new('name must be String')
        end

        return 'ja\.|en\.|'      if name == 'locale_code'
        return '\?.+|'           if name == 'query_string'
        return '[0-9a-zA-Z_\-]+' if name == 'user_name'
        return '.*'
      end

      def self.restore(name, value)
        unless name.is_a? String
          raise TypeError.new('name must be String')
        end
        unless value.is_a? String
          raise TypeError.new('value must be String')
        end

        case name
        when 'locale_code'
          restore_value = value.gsub(/\.$/, '')
        when 'query_string'
          restore_value = value.gsub(/^\?/, '')
        else
          restore_value = value
        end
        return Rack::Utils.unescape(restore_value)
      end
    end
  end
end
