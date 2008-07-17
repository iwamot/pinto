# lib/pinto/uri/expand_processor.rb

module Pinto
  module URI
    class ExpandProcessor
      def self.transform(name, value)
        return '.' + value if name == 'lang'
        return '?' + value if name == 'query'
        return value
      end
    end
  end
end
