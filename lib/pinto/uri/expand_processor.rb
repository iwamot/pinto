module Pinto
  class URI
    class ExpandProcessor
      def self.transform(name, value)
        return '.' + value if name == 'lang'
        return value
      end
    end
  end
end
