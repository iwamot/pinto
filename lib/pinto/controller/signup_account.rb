# lib/pinto/controller/signup_account.rb
module Pinto
  module Controller
    class SignupAccount
      include Pinto::Controller::Private::Base
      def get_action(request)
        unless request.is_a? Pinto::Request
          raise ArgumentError.new('request must be Pinto::Request')
        end

        request_lang = request.get_uri_map.to_hash['lang']
        if request_lang.empty?
          http_status_code = Pinto::Type::HttpStatusCode.new(400)
          translator = Pinto::Translator.new(
            Pinto::Locale.new(request_lang)
          )
          message = translator._('URI contains no valid language')
          message = Pinto::Type::ErrorMessage.new(message)
          return Pinto::Controller::Private::Error.run(
            request, http_status_code, message
          )
        end

        query_strings = Pinto::Type::QueryStrings.new(request.GET)
        current_uri   = Pinto::Type::URI.new(request.url)
        claimed_id = Pinto::OpenID.complete(query_strings, current_uri)
        if claimed_id.nil?
          http_status_code = Pinto::Type::HttpStatusCode.new(400)
          translator = Pinto::Translator.new(
            Pinto::Locale.new(request_lang)
          )
          message = translator._('OpenID authentication failed')
          message = Pinto::Type::ErrorMessage.new(message)
          return Pinto::Controller::Private::Error.run(
            request, http_status_code, message
          )
        end

        Pinto::Model::SignupReservation.add(
          Pinto::Type::ClaimedID.new(claimed_id)
        )

        base_lang = Pinto::Locale.new(request_lang)
        other_languages = base_lang.others
        param = {
          :lang       => request_lang,
          :claimed_id => claimed_id,
          :user_name  => ''
        }

        view_name  = Pinto::Type::ViewName.new('signup_account')
        view_param = Pinto::Type::ViewParam.new(param)
        response_body = Pinto::View.render(view_name, view_param)

        return [
          200,
          {'Content-Type' => 'application/xhtml+xml; charset=UTF-8'},
          [response_body]
        ]
      end
    end
  end
end
