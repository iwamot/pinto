module Pinto
  class Config
    class DB
      attr_reader :host, :name, :user, :password

      def self.load
        config = YAML.load_file('config/db.yml')
        self.new(config['host'],
                 config['name'],
                 config['user'],
                 config['password'])
      end

      def initialize(host, name, user, password)
        @host     = host
        @name     = name
        @user     = user
        @password = password
      end
    end
  end
end
