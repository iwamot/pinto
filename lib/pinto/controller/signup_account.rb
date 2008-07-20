# lib/pinto/controller/signup_auth.rb

require 'pinto/config'
require 'pinto/controller/private/base'
require 'pinto/controller/private/error'
require 'pinto/helper/uri'
require 'pinto/openid'
require 'pinto/translate'

module Pinto
  module Controller
    class SignupAccount
      include Pinto::Controller::Private::Base

      def get_action(request)
        request_lang = request.uri_map['lang']
        if request_lang.empty?
          translator = Pinto::Translate.new(request_lang)
          message = translator._('URI contains no valid language')
          return Pinto::Controller::Private::Error.run(request, 400, message)
        end

        claimed_id = Pinto::OpenID.complete(request.GET, request.url)
        if claimed_id.nil?
          translator = Pinto::Translate.new(request_lang)
          message = translator._('OpenID authentivation failed')
          return Pinto::Controller::Private::Error.run(request, 400, message)
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
