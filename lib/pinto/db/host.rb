module Pinto
  module DB
    class Host
      def initialize(host)
        unless host.respond_to? :to_s
          raise TypeError.new('host must respond to #to_s')
        end

        @host = host.to_s
      end

      def to_s
        return @host
      end
    end
  end
end
