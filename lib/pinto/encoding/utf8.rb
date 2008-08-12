module Pinto
  module Encoding
    class UTF8
      def self.valid?(value)
        value = value.to_s

        valid_utf8 = /^(?:
           [\x00-\x7F]                    # U+0000   - U+007F
          |[\xC2-\xDF][\x80-\xBF]         # U+0080   - U+07FF
          |\xE0[\xA0-\xBF][\x80-\xBF]     # U+0800   - U+0FFF
          |[\xE1-\xEC][\x80-\xBF]{2}      # U+1000   - U+CFFF
          |\xED[\x80-\x9F][\x80-\xBF]     # U+D000   - U+D7FF
          |\xEF[\x80-\xBF][\x80-\xBD]     # U+E000   - U+FFFD
          |\xF0[\x90-\xBF][\x80-\xBF]{2}  # U+10000  - U+3FFFF
          |[\xF1-\xF3][\x80-\xBF]{3}      # U+40000  - U+FFFFF
          |\xF4[\x80-\x8F][\x80-\xBF]{2}  # U+100000 - U+10FFFF
        )*$/x
        return !value.match(valid_utf8).nil?
      end
    end
  end
end
