# lib/pinto/controller/signup_openid.rb
module Pinto
  module Controller
    class SignupOpenid
      include Pinto::Controller::Private::Base
      def get_action(request)
        unless request.is_a? Pinto::Request
          raise ArgumentError.new('request must be Pinto::Request')
        end

        request_lang = request.get_uri_map.to_hash['lang']
        if request_lang.empty?
          return Pinto::Controller::Private::Multiple.run(request)
        end

        base_lang = Pinto::Locale.new(request_lang)
        other_languages = base_lang.others

        config_key = Pinto::Type::ConfigKey.new('openid_providers')
        providers = Pinto::Config.load(config_key)

        param = {
          :lang        => request_lang,
          :other_langs => other_languages,
          :providers   => providers
        }

        view_name  = Pinto::Type::ViewName.new('signup_openid')
        view_param = Pinto::Type::ViewParam.new(param)
        response_body = Pinto::View.render(view_name, view_param)

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
