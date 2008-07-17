# lib/pinto/uri/extract_processor.rb

require 'rack'

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
        case name
        when 'lang'
          restore_value = value.gsub(/^\./, '')
        when 'query'
          restore_value = value.gsub(/^\?/, '')
        else
          restore_value = value
        end
        return Rack::Utils.unescape(restore_value)
      end
    end
  end
end
