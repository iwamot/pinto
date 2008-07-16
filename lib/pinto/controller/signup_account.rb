# lib/pinto/controller/signup_auth.rb

require 'openid'
require 'openid/store/filesystem'
require 'pinto/config'
require 'pinto/helper/uri'

module Pinto
  module Controller
    class SignupAccount
      def self.run(request)
        request_lang = request.uri_map['lang']
        if request_lang.empty?
          return [
            400,
            {'Content-Type' => ''},
            []
          ]
        end

        store = OpenID::Store::Filesystem.new('openid')
        consumer = OpenID::Consumer.new({}, store)
        query = request.GET
        response = consumer.complete(query, request.url)

        unless response.is_a? OpenID::Consumer::SuccessResponse
          return [
            400,
            {'Content-Type' => 'text/plain; charset=UTF-8'},
            [response.inspect]
          ]
        end

        claimed_id = response.identity_url

        return [
          200,
          {'Content-Type' => 'text/plain; charset=UTF-8'},
          [claimed_id]
        ]
      end
    end
  end
end
