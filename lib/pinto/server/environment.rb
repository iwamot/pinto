module Pinto
  module Server
    class Environment
      def initialize(server_environment)
        @server_environment = server_environment.to_hash
      end

      def to_hash
        return @server_environment
      end
    end
  end
end
