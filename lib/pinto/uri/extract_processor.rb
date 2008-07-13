# lib/pinto/uri/extract_processor.rb

module Pinto
  module URI
    class ExtractProcessor
      def self.match(name)
        return '\.ja|\.en|'      if name == 'lang'
        return '\?.+|'           if name == 'query'
        return '[0-9a-zA-Z_\-]+' if name == 'username'
        return '.*'
      end

      def self.restore(name, value)
        return value.gsub(/^\./, '') if name == 'lang'
        return value.gsub(/^\?/, '') if name == 'query'
        return value
      end
    end
  end
end
