module Pinto
  class Config
    class DB
      def self.load
        config = YAML.load_file('config/db.yml')
        host     = Pinto::DB::Host.new(config['host'])
        name     = Pinto::DB::Name.new(config['name'])
        user     = Pinto::DB::User.new(config['user'])
        password = Pinto::DB::Password.new(config['password'])

        return self.new(host, name, user, password)
      end

      def initialize(host, name, user, password)
        host = Pinto::DB::Host.new(host)
        name = Pinto::DB::Name.new(name)
        user = Pinto::DB::User.new(user)
        password = Pinto::DB::Password.new(password)

        @host     = host
        @name     = name
        @user     = user
        @password = password
      end

      def host
        return @host
      end

      def name
        return @name
      end

      def user
        return @user
      end

      def password
        return @password
      end
    end
  end
end
