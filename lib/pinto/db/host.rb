# lib/pinto/db/host.rb

module Pinto
  module DB
    class Host
      def initialize(host)
        unless host.is_a? String
          raise ArgumentError.new('host must be String')
        end

        @host = host
      end

      def to_s
        return @host
      end
    end
  end
end
