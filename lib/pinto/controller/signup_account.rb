# lib/pinto/controller/signup_account.rb

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
          message = translator._('OpenID authentication failed')
          return Pinto::Controller::Private::Error.run(request, 400, message)
        end

        Pinto::Model::SignupReservation.add(claimed_id)

        other_languages = Pinto::Language.get_other(request_lang)
        param = {
          :lang       => request_lang,
          :claimed_id => claimed_id
        }

        response_body = Pinto::View.render('signup_account', param)

        return [
          200,
          {'Content-Type' => 'application/xhtml+xml; charset=UTF-8'},
          [response_body]
        ]
      end
    end
  end
end
