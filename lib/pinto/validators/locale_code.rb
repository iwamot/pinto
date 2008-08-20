# Service Provider

module Pinto
  class LocaleCodeValidator
    attr_writer :config

    def matcher
      @config.locales.map do |locale|
        locale.code
      end.push('').join('\.|')
    end

    def restore_proc
      proc{|s| s.gsub(/\.$/, '')}
    end
  end
end
