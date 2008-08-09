# lib/pinto/helper/html/escaper.rb
module Pinto
  module Helper
    module HTML
      module Escaper
        def escape_value(value)
          unless value.is_a? String
            raise ArgumentError.new('value must be String')
          end

          escape_chars = Pinto::Type::EscapeChars.new(['&', '<', '>'])
          return eliminate(value, escape_chars)
        end

        def escape_attribute(value)
          unless value.is_a? String
            raise ArgumentError.new('value must be String')
          end

          escape_chars = Pinto::Type::EscapeChars.new(['&', '<', '>', '"'])
          return eliminate(value, escape_chars)
        end

        def escape_tag(value)
          unless value.is_a? String
            raise ArgumentError.new('value must be String')
          end

          return eliminate(value)
        end

        private

        ESCAPE_TABLE = {
          '&' => '&amp;',
          '<' => '&lt;',
          '>' => '&gt;',
          '"' => '&quot;'
        }

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
            raise ArgumentError.new('value is not UTF-8 string')
          end

          control_codes = /
             [\x00-\x08]|\x0B|\x0C|[\x0E-\x1F]  # C0 control codes
            |\x7F                               # DEL
            |\xC2[\x80-\x9F]                    # C1 control codes
          /ux
          value.gsub!(control_codes, '')

          return value if escape_chars.to_a.length == 0

          return value.gsub(/[#{escape_chars.to_a.join}]/) do |s|
            ESCAPE_TABLE[s]
          end
        end
      end
    end
  end
end
