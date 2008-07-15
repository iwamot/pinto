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
        # ToDo：言語が未指定の場合はエラーにすること

        store = OpenID::Store::Filesystem.new('openid')
        consumer = OpenID::Consumer.new({}, store)
        query = request.GET
#        query.delete('uri_map')
        response = consumer.complete(query, request.url)

        unless response.is_a? OpenID::Consumer::SuccessResponse
          return [
            400,
            {'Content-Type' => 'text/plain; charset=UTF-8'},
            [response.inspect]
          ]
        end

        claimed_id = response.identity_url

        # ToDo：ClaimedIDを保存すること

        return [
          200,
          {'Content-Type' => 'text/plain; charset=UTF-8'},
#          [response.identity_url]
          [claimed_id.inspect]
        ]
      end
    end
  end
end
