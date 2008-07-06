# lib/pinto/config.rb

require 'yaml'

module Pinto
  class Config
    def self.load(key = nil)
      config = YAML.load_file('../config/config.yml')
      return config[key] unless key.nil?
      return config
    end
  end
end
