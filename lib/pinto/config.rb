# lib/pinto/config.rb

module Pinto
  class Config
    def self.load(key)
      unless key.is_a? Pinto::Type::ConfigKey
        raise ArgumentError.new('key must be Pinto::Type::ConfigKey')
      end

      config = YAML.load_file('config/main.yml')
      if config[key.to_s].nil?
        raise ArgumentError.new('non-existent key was given')
      end

      return config[key.to_s]
    end
  end
end
