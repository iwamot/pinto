# Service Provider

module Pinto
  class UserNameValidator
    def matcher
      '[0-9a-zA-Z_\-.]{1,32}'
    end
  end
end
