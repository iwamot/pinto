# lib/pinto/type/config_key.rb

module Pinto
  module Type
    class ConfigKey
      def initialize(config_key)
        unless config_key.is_a? String
          raise ArgumentError.new('config_key must be String')
        end

        @config_key = config_key
      end

      def to_s
        return @config_key
      end
    end
  end
end
