module Pinto
  class Config
    class Key
      def initialize(config_key)
        unless config_key.respond_to? :to_s
          raise TypeError.new('config_key must respond to #to_s')
        end

        @config_key = config_key.to_s
      end

      def to_s
        return @config_key
      end
    end
  end
end
