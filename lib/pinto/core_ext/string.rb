class String
  def camelize
    self.split('_').map{|word| word.capitalize}.join
  end

  def remove_control_code
    raise ArgumentError.new('must be UTF-8 string') unless self.utf8?

    control_codes = /
       [\x00-\x08]|\x0B|\x0C|[\x0E-\x1F]  # C0 control codes
      |\x7F                               # DEL
      |\xC2[\x80-\x9F]                    # C1 control codes
    /ux

    self.gsub(control_codes, '')
  end

  def utf8?
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

    !self.match(valid_utf8).nil?
  end
end
