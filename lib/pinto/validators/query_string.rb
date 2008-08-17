# Service Provider

module Pinto
  class QueryStringValidator
    def matcher
      '\?.+|'
    end

    def restore_proc
      proc{|s| s.gsub(/^\?/, '')}
    end
  end
end
