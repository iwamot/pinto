module Pinto
  class Config
    def self.load(config_key)
      config_key = Pinto::Config::Key.new(config_key)

      config = YAML.load_file('config/main.yml')
      if config[config_key.to_s].nil?
        raise ArgumentError.new('non-existent config_key was given')
      end

      return config[config_key.to_s]
    end

    def self.uri_templates
      uri_templates = Pinto::URI::Templates.new
      self.load('uri_templates').each do |controller_name, uri_template|
        uri_templates.add(controller_name, uri_template)
      end
      return uri_templates
    end

    def self.openid_providers
      openid_providers = Pinto::OpenID::Providers.new
      self.load('openid_providers').each do |openid_provider|
        openid_providers.add(openid_provider)
      end
      return openid_providers
    end

    def self.valid_openid_provider?(openid_provider)
      openid_provider = Pinto::OpenID::Provider.new(openid_provider)

      return self.openid_providers.include?(openid_provider)
    end
  end
end
