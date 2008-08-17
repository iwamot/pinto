# Service Provider

module Pinto
  class LocaleCodeValidator
    def matcher
      PintoBeans::Config.new.locales.map do |locale|
        locale.code
      end.push('').join('\.|')
    end

    def restore_proc
      proc{|s| s.gsub(/\.$/, '')}
    end
  end
end
