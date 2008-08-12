module Pinto
  module Controller
    class SignupAuth
      include Pinto::Controller::Base

      def get_action(request)
        request = Pinto::HTTP::Request.new(request)

        user_supplied_id = Pinto::OpenID::UserSuppliedID.new(
          request.query('openid')
        )

        unless Pinto::Config.valid_openid_provider? user_supplied_id
          return Pinto::Controller::Error.run(
            request, 400, Pinto::Translator.new(request.locale_code)._(
              'Requested OpenID provider is not permitted'
            )
          )
        end

        if request.no_locale?
          return Pinto::Controller::Error.run(
            request, 400, Pinto::Translator.new._(
              'URI contains no valid language'
            )
          )
        end

        response = Pinto::HTTP::Response.new
        response.status_code = 303
        response.location =
          Pinto::OpenID.begin(user_supplied_id, request.locale_code)
        return response
      end
    end
  end
end
