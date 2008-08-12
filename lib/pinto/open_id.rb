module Pinto
  class OpenID
    def self.begin(user_supplied_id, locale_code)
      user_supplied_id = Pinto::OpenID::UserSuppliedID.new(user_supplied_id)
      locale_code = Pinto::Locale::Code.new(locale_code)

      request = self.consumer.begin(user_supplied_id.to_s)

      realm     = Pinto::Helper::URI.expand('index',
                                            'locale_code' => locale_code)
      return_to = Pinto::Helper::URI.expand('signup_account',
                                            'locale_code' => locale_code)

      return request.redirect_url(realm.to_s, return_to.to_s)
    end

    def self.complete(query_strings, uri)
      query_strings = Pinto::URI::QueryStrings.new(query_strings)
      uri = Pinto::URI.new(uri)

      response = self.consumer.complete(query_strings.to_hash, uri.to_s)
      unless response.is_a? ::OpenID::Consumer::SuccessResponse
        raise RuntimeError.new(response.message)
      end
      return response.identity_url
    end

    def self.consumer
      store = ::OpenID::Store::Filesystem.new('openid')
      return ::OpenID::Consumer.new({}, store)
    end
  end
end
