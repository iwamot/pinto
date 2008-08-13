module Pinto
  module URI
    class ExpandProcessor
      def self.transform(name, value)
        value = value.to_s
        case name
        when 'locale_code'
          value + '.'
        when 'query_string'
          '?' + value
        else
          value
        end
      end
    end
  end
end
