module Pinto
  module Controller
    class SignupAccount
      include Pinto::Controller::Base

      def get_action(request)
        if request.no_locale?
          return request.bad_request(request._('URI contains no locale'))
        end

        begin
          claimed_id = Pinto::OpenID::Consumer.new.complete(
            request.query_strings, request.uri
          )
        rescue
          return request.bad_request(request._('OpenID authentication failed'))
        end

        Pinto::Model::SignupReservation.add(claimed_id)

        view = Pinto::View.new('signup_account')
        view.set_parameter(:locale_code, request.locale_code)
        view.set_parameter(:claimed_id, claimed_id)

        response = Pinto::HTTP::Response.new
        response.status_code = Pinto::HTTP::StatusCode::OK
        response.content_type = Pinto::HTTP::ContentType::XHTML
        response.body = view.render
        return response
      end
    end
  end
end
