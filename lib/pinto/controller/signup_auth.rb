# lib/pinto/controller/signup_auth.rb
module Pinto
  module Controller
    class SignupAuth
      include Pinto::Controller::Private::Base
      def get_action(request)
        unless request.is_a? Pinto::Request
          raise ArgumentError.new('request must be Pinto::Request')
        end

        request_lang = request.get_uri_map.to_hash['lang']
        openid = request.GET['openid']

        config_key = Pinto::Type::ConfigKey.new('openid_providers')
        providers = Pinto::Config.load(config_key)
        unless providers.include? openid
          http_status_code = Pinto::Type::HttpStatusCode.new(400)
          translator = Pinto::Translator.new(request_lang)
          message = translator._('Requested OpenID provider is not permitted')
          message = Pinto::Type::ErrorMessage.new(message)
          return Pinto::Controller::Private::Error.run(
            request, http_status_code, message
          )
        end

        if request_lang.empty?
          http_status_code = Pinto::Type::HttpStatusCode.new(400)
          translator = Pinto::Translator.new(request_lang)
          message = translator._('URI contains no valid language')
          message = Pinto::Type::ErrorMessage.new(message)
          return Pinto::Controller::Private::Error.run(
            request, http_status_code, message
          )
        end

        user_supplied_id = Pinto::Type::UserSuppliedID.new(openid)
        lang = Pinto::Locale.new(request_lang)
        redirect_uri = Pinto::OpenID.begin(user_supplied_id, lang)

        return [
          303,
          {'Location' => redirect_uri, 'Content-Type' => ''},
          []
        ]
      end
    end
  end
end
