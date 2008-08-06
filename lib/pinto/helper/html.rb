# lib/pinto/helper/html.rb
module Pinto
  module Helper
    module HTML
      ESCAPE_TABLE = {
        '&' => '&amp;',
        '<' => '&lt;',
        '>' => '&gt;',
        '"' => '&quot;'
      }
      module_function

      def escape_for_value(value)
        unless value.is_a? String
          raise ArgumentError.new('value must be String')
        end

        escape_chars = Pinto::Type::EscapeChars.new(['&', '<', '>'])
        return eliminate(value, escape_chars)
      end

      def escape_for_quote(value)
        unless value.is_a? String
          raise ArgumentError.new('value must be String')
        end

        escape_chars = Pinto::Type::EscapeChars.new(['&', '<', '>', '"'])
        return eliminate(value, escape_chars)
      end

      def escape_for_tag(value)
        unless value.is_a? String
          raise ArgumentError.new('value must be String')
        end

        return eliminate(value)
      end

      alias h        escape_for_value
      alias in_quote escape_for_quote
      alias has_tag  escape_for_tag

      def eliminate(value, escape_chars = Pinto::Type::EscapeChars.new([]))
        unless value.is_a? String
          raise ArgumentError.new('value must be String')
        end
        unless escape_chars.is_a? Pinto::Type::EscapeChars
          raise ArgumentError.new(
            'escape_chars must be Pinto::Type::EscapeChars'
          )
        end

        unless Pinto::Encoding::UTF8.valid? value
          raise ArgumentError.new('value is not UTF8 string')
        end

        control_codes = /
           [\x00-\x08]|\x0B|\x0C|[\x0E-\x1F]  # C0 control codes
          |\x7F                               # DEL
          |\xC2[\x80-\x9F]                    # C1 control codes
        /ux
        value.gsub!(control_codes, '')

        return value.gsub(/[#{escape_chars.to_a.join}]/) {|s| ESCAPE_TABLE[s]}
      end
    end
  end
end
