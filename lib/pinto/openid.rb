# lib/pinto/openid.rb

require 'openid'
require 'openid/store/filesystem'
require 'pinto/helper/uri'

module Pinto
  class OpenID
    def self.begin(openid, lang)
      realm     = Pinto::Helper::URI.uri('top')
      return_to = Pinto::Helper::URI.uri('signup_account', 'lang' => lang)

      request = self.consumer().begin(openid)
      return request.redirect_url(realm, return_to)
    end

    def self.complete(query, uri)
      response = self.consumer().complete(query, uri)
      unless response.is_a? ::OpenID::Consumer::SuccessResponse
        return nil
      end
      return response.identity_url
    end

    def self.consumer()
      store = ::OpenID::Store::Filesystem.new('openid')
      return ::OpenID::Consumer.new({}, store)
    end
  end
end
