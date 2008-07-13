# lib/pinto/controller/signup_openid.rb

require 'pinto/config'
require 'pinto/view'

module Pinto
  module Controller
    class SignupOpenid
      def self.run(request)
        request_lang = request['uri_map']['lang']
        languages = Pinto::Config.load('languages')

        if request_lang.empty?
          param = {
            :controller => 'signup_openid',
            :languages  => languages
          }
          response_body = Pinto::View.render('multiple', param)
          return [
            300,
            {'Content-Type' => 'application/xhtml+xml; charset=UTF-8'},
            [response_body]
          ]
        end

        other_languages = languages.delete_if do |lang|
          lang['code'] == request_lang
        end

        providers = Pinto::Config.load('openid_providers')

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
