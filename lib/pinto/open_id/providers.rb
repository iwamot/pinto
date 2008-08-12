module Pinto
  class OpenID
    class Providers
      def initialize
        @openid_providers = []
      end

      def add(openid_provider)
        openid_provider = Pinto::OpenID::Provider.new(openid_provider)

        @openid_providers.push(
          Pinto::OpenID::Provider.new(openid_provider)
        )
      end

      def to_a
        return @openid_providers
      end

      def each
        @openid_providers.each do |item|
          yield item
        end
      end

      def include?(openid_provider)
        openid_provider = Pinto::OpenID::Provider.new(openid_provider)

        return @openid_providers.include? openid_provider
      end
    end
  end
end
