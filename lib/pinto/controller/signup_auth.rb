module Pinto
  module Controller
    class SignupAuth
      include Pinto::Controller::Base

      def get_action(request)
        user_supplied_id = request.query('openid')

        unless Pinto::Config.valid_openid_provider? user_supplied_id
          return request.bad_request(
            request._('Requested OpenID provider is not permitted')
          )
        end

        if request.no_locale?
          return request.bad_request(request._('URI contains no locale'))
        end

        response = Pinto::HTTP::Response.new
        response.status_code = Pinto::HTTP::StatusCode::SEE_OTHER
        response.location = Pinto::OpenID::Consumer.new.begin(
          user_supplied_id, request.locale_code
        )
        response
      end
    end
  end
end
