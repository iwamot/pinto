# lib/pinto/controller/signup_auth.rb

require 'pinto/config'
require 'pinto/controller/private/base'
require 'pinto/controller/private/error'
require 'pinto/helper/uri'
require 'pinto/openid'

module Pinto
  module Controller
    class SignupAccount
      include Pinto::Controller::Private::Base

      def get_action(request)
        request_lang = request.uri_map['lang']
        if request_lang.empty?
          return Pinto::Controller::Private::Error.run(request, 400)
        end

        claimed_id = Pinto::OpenID.complete(request.GET, request.url)
        if claimed_id.nil?
          return Pinto::Controller::Private::Error.run(request, 400)
        end

        return [
          200,
          {'Content-Type' => 'text/plain; charset=UTF-8'},
          [claimed_id]
        ]
      end
    end
  end
end
