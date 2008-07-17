# lib/pinto/controller/signup_auth.rb

require 'pinto/config'
require 'pinto/controller/error'
require 'pinto/openid'

module Pinto
  module Controller
    class SignupAuth
      def self.run(request)
        openid = request.GET['openid']
        providers = Pinto::Config.load('openid_providers')
        unless providers.include? openid
          return Pinto::Controller::Error.run(request, 400)
        end

        request_lang = request.uri_map['lang']
        if request_lang.empty?
          return Pinto::Controller::Error.run(request, 400)
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
