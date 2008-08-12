module Pinto
  class OpenID
    class Provider
      def initialize(openid_provider)
        @openid_provider = openid_provider.to_s
      end

      def to_s
        return @openid_provider
      end

      def ==(other)
        other = Pinto::OpenID::Provider.new(other)

        return (self.to_s == other.to_s)
      end
    end
  end
end
