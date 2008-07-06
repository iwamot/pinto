# lib/pinto/view/helper/html.rb

require 'pinto/encoding/utf8'

module Pinto
  class View
    class Helper
      module HTML
        ESCAPE_TABLE = {
          '&' => '&amp;',
          '<' => '&lt;',
          '>' => '&gt;',
          '"' => '&quot;'
        }

        def escape_for_value(value)
          escape_chars = ['&', '<', '>']
          return eliminate(value, escape_chars)
        end

        def escape_for_quote(value)
          escape_chars = ['&', '<', '>', '"']
          return eliminate(value, escape_chars)
        end

        def escape_for_tag(value)
          return eliminate(value)
        end

        alias h        escape_for_value
        alias in_quote escape_for_quote
        alias has_tag  escape_for_tag

        def eliminate(value, escape_chars = nil)
          str = value.to_s
          raise ArgumentError unless Pinto::Encoding::UTF8.valid? str

          control_codes = /
             [\x00-\x08]|\x0B|\x0C|[\x0E-\x1F]  # C0 control codes
            |\x7F                               # DEL
            |\xC2[\x80-\x9F]                    # C1 control codes
          /ux
          str.gsub!(control_codes, '')

          return str unless escape_chars.is_a? Array
          return str.gsub(/[#{escape_chars.join}]/) {|s| ESCAPE_TABLE[s]}
        end
      end
    end
  end
end
