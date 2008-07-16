# lib/pinto/controller/signup_auth.rb

require 'openid'
require 'openid/store/filesystem'
require 'pinto/config'
require 'pinto/helper/uri'

module Pinto
  module Controller
    class SignupAuth
      def self.run(request)
        openid = request.GET['openid']
        providers = Pinto::Config.load('openid_providers')
        unless providers.include? openid
          return [
            403,
            {'Content-Type' => ''},
            []
          ]
        end

        request_lang = request.uri_map['lang']

        return_url = Pinto::Helper::URI.uri(
          'signup_account', 'lang' => request_lang
        )

        store = OpenID::Store::Filesystem.new('openid')
        consumer = OpenID::Consumer.new({}, store)
        request = consumer.begin(openid)
        redirect_url = request.redirect_url('http://pinto.jp/', return_url)

        return [
          303,
          {'Location' => redirect_url, 'Content-Type' => ''},
          []
        ]
      end
    end
  end
end
