# lib/pinto/config.rb

module Pinto
  class Config
    def self.load(key = nil)
      config = YAML.load_file('config/main.yml')
      return config[key] unless key.nil?
      return config
    end

    def self.db
      return YAML.load_file('config/db.yml')
    end
  end
end
