# Service Provider

module Pinto
  class LocaleSetter
    def set(config)
      config.set_locale('en', config._('English'))
      config.set_locale('ja', config._('Japanese'))
    end
  end
end
