# lib/pinto/controller/signup_openid.rb

require 'pinto/controller/multiple'
require 'pinto/language'
require 'pinto/view'

module Pinto
  module Controller
    class SignupOpenid
      def self.run(request)
        request_lang = request.uri_map['lang']
        if request_lang.empty?
          return Pinto::Controller::Multiple.run(request)
        end

        other_languages = Pinto::Language.get_other(request_lang)
        providers       = Pinto::Config.load('openid_providers')

        param = {
          :lang        => request_lang,
          :other_langs => other_languages,
          :providers   => providers
        }
        response_body = Pinto::View.render('signup_openid', param)

        return [
          200,
          {'Content-Type' => 'application/xhtml+xml; charset=UTF-8'},
          [response_body]
        ]
      end
    end
  end
end
