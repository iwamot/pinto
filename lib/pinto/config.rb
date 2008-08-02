# lib/pinto/config.rb

module Pinto
  class Config
    def self.load(key)
      unless key.is_a? Pinto::Type::ConfigKey
        raise ArgumentError.new('key must be Pinto::Type::ConfigKey')
      end

      config = YAML.load_file('config/main.yml')
      return config[key.to_s]
    end

    def self.db
      return YAML.load_file('config/db.yml')
    end
  end
end
