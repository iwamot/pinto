# lib/pinto/config/db.rb
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
        unless host.is_a? Pinto::DB::Host
          raise ArgumentError.new('host must be Pinto::DB::Host')
        end
        unless name.is_a? Pinto::DB::Name
          raise ArgumentError.new('name must be Pinto::DB::Name')
        end
        unless user.is_a? Pinto::DB::User
          raise ArgumentError.new('user must be Pinto::DB::User')
        end
        unless password.is_a? Pinto::DB::Password
          raise ArgumentError.new('password must be Pinto::DB::Password')
        end

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
