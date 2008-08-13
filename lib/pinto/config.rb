module Pinto
  class Config
    def self.load(key)
      config = YAML.load_file('config/main.yml')
      raise ArgumentError.new('non-existent key was given') if config[key].nil?
      config[key]
    end

    def self.uri_templates
      self.load('uri_templates')
    end

    def self.openid_providers
      self.load('openid_providers')
    end

    def self.valid_openid_provider?(openid_provider)
      self.openid_providers.include? openid_provider
    end
  end
end
