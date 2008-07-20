# lib/pinto/controller/signup_auth.rb

require 'pinto/config'
require 'pinto/controller/private/base'
require 'pinto/controller/private/error'
require 'pinto/openid'
require 'pinto/translate'

module Pinto
  module Controller
    class SignupAuth
      include Pinto::Controller::Private::Base

      def get_action(request)
        request_lang = request.uri_map['lang']
        openid = request.GET['openid']

        providers = Pinto::Config.load('openid_providers')
        unless providers.include? openid
          translator = Pinto::Translate.new(request_lang)
          message = translator._('Requested OpenID provider is not permitted')
          return Pinto::Controller::Private::Error.run(request, 400, message)
        end

        if request_lang.empty?
          translator = Pinto::Translate.new(request_lang)
          message = translator._('URI contains no valid language')
          return Pinto::Controller::Private::Error.run(request, 400, message)
        end

        redirect_url = Pinto::OpenID::begin(openid, request_lang)

        return [
          303,
          {'Location' => redirect_url, 'Content-Type' => ''},
          []
        ]
      end
    end
  end
end
