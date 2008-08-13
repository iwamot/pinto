module Pinto
  module Helper
    module HTML
      module Escaper
        def escape_value(value)
          self.escape(value, ['&', '<', '>'])
        end

        def escape_attribute(value)
          self.escape(value, ['&', '<', '>', '"'])
        end

        def escape_tag(value)
          self.escape(value)
        end

        ESCAPE_TABLE = {
          '&' => '&amp;',
          '<' => '&lt;',
          '>' => '&gt;',
          '"' => '&quot;'
        }

        def escape(value, escape_characters = [])
          value = value.to_s.remove_control_code
          return value if escape_characters.empty?
          value.gsub(/[#{escape_characters.join}]/) do |s|
            ESCAPE_TABLE[s]
          end
        end
      end
    end
  end
end
