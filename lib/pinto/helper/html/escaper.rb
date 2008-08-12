module Pinto
  module Helper
    module HTML
      module Escaper
        def escape_value(value)
          unless value.respond_to? 'to_s'
            raise ArgumentError.new('value must respond to to_s')
          end

          escape_chars = Pinto::Characters.new(['&', '<', '>'])
          return eliminate(value.to_s, escape_chars)
        end

        def escape_attribute(value)
          unless value.respond_to? 'to_s'
            raise ArgumentError.new('value must respond to to_s')
          end

          escape_chars = Pinto::Characters.new(['&', '<', '>', '"'])
          return eliminate(value.to_s, escape_chars)
        end

        def escape_tag(value)
          unless value.respond_to? 'to_s'
            raise ArgumentError.new('value must respond to to_s')
          end

          return eliminate(value.to_s)
        end

        private

        ESCAPE_TABLE = {
          '&' => '&amp;',
          '<' => '&lt;',
          '>' => '&gt;',
          '"' => '&quot;'
        }

        def eliminate(value, escape_chars = [])
          unless value.respond_to? 'to_s'
            raise TypeError.new('value must respond to #to_s')
          end

          value = value.to_s
          escape_chars = Pinto::Characters.new(escape_chars)

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
