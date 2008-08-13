module Pinto
  module URI
    class ExtractProcessor
      def self.match(name)
        case name
        when 'locale_code'
          Pinto::Locale.code_list.push('').join('\.|')
        when 'query_string'
          '\?.+|'
        when 'user_name'
          Pinto::User::Name.extract_matcher
        else
          '.*'
        end
      end

      def self.restore(name, value)
        restore_value = case name
                        when 'locale_code'
                          value.gsub(/\.$/, '')
                        when 'query_string'
                          value.gsub(/^\?/, '')
                        else
                          value
                        end
        Rack::Utils.unescape(restore_value)
      end
    end
  end
end
