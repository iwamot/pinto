# lib/pinto/open_id.rb
module Pinto
  class OpenID
    def self.begin(user_supplied_id, lang)
      unless user_supplied_id.is_a? Pinto::Type::UserSuppliedID
        raise ArgumentError.new(
          'user_supplied_id must be Pinto::Type::UserSuppliedID'
        )
      end
      unless lang.is_a? Pinto::Locale
        raise ArgumentError.new('lang must be Pinto::Locale')
      end
      request = self.consumer.begin(user_supplied_id.to_s)

      realm     = Pinto::Helper::URI.uri('index',          'lang' => lang.to_s)
      return_to = Pinto::Helper::URI.uri('signup_account', 'lang' => lang.to_s)

      return request.redirect_url(realm, return_to)
    end

    def self.complete(query, uri)
      unless query.is_a? Pinto::Type::QueryStrings
        raise ArgumentError.new('query must be Pinto::Type::QueryStrings')
      end
      unless uri.is_a? Pinto::Type::URI
        raise ArgumentError.new('uri must be Pinto::Type::URI')
      end

      response = self.consumer.complete(query.to_hash, uri.to_s)
      unless response.is_a? ::OpenID::Consumer::SuccessResponse
        return nil
      end
      return response.identity_url
    end

    def self.consumer
      store = ::OpenID::Store::Filesystem.new('openid')
      return ::OpenID::Consumer.new({}, store)
    end
  end
end
