module Pinto
  module Controller
    class SignupAccount
      include Pinto::Controller::Base

      def get_action(request)
        request = Pinto::HTTP::Request.new(request)

        if request.no_locale?
          return Pinto::Controller::Error.run(
            request, 400, Pinto::Translator.new._(
              'URI contains no valid language'
            )
          )
        end

        begin
          claimed_id = Pinto::OpenID.complete(request.query_strings,
                                              request.uri)
        rescue
          return Pinto::Controller::Error.run(
            request, 400, Pinto::Translator.new(request.locale_code)._(
              'OpenID authentication failed'
            )
          )
        end

        Pinto::Model::SignupReservation.add(claimed_id)

        view = Pinto::View.new
        view.name = 'signup_account'
        view.set_parameter(:locale_code, request.locale_code)
        view.set_parameter(:claimed_id, claimed_id)

        response = Pinto::HTTP::Response.new
        response.status_code = 200
        response.content_type = 'application/xhtml+xml; charset=UTF-8'
        response.body = view.render
        return response
      end
    end
  end
end
