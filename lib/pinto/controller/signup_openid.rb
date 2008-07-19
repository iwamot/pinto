# lib/pinto/controller/signup_openid.rb

require 'pinto/controller/private/base'
require 'pinto/controller/private/multiple'
require 'pinto/helper/uri'
require 'pinto/language'
require 'pinto/view'

module Pinto
  module Controller
    class SignupOpenid
      include Pinto::Controller::Private::Base

      def get_action(request)
        request_lang = request.uri_map['lang']
        if request_lang.empty?
          return Pinto::Controller::Private::Multiple.run(request)
        end

        other_languages = Pinto::Language.get_other(request_lang)
        providers       = Pinto::Config.load('openid_providers')

        param = {
          :lang        => request_lang,
          :other_langs => other_languages,
          :providers   => providers
        }

        response_body = Pinto::View.render('signup_openid', param)

        platonic_uri = Pinto::Helper::URI.uri('signup_openid')

        return [
          200,
          {
            'Content-Type'     => 'application/xhtml+xml; charset=UTF-8',
            'Content-Location' => platonic_uri
          },
          [response_body]
        ]
      end
    end
  end
end
