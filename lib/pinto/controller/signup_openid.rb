module Pinto
  module Controller
    class SignupOpenid
      include Pinto::Controller::Base

      def get_action(request)
        return request.multiple if request.no_locale?

        view = Pinto::View.new('signup_openid')
        view.set_parameter(:locale_code, request.locale_code)
        view.set_parameter(:other_locales,
                           Pinto::Locale.others(request.locale_code))
        view.set_parameter(:openid_providers, Pinto::Config.openid_providers)

        response = Pinto::HTTP::Response.new
        response.status_code = Pinto::HTTP::StatusCode::OK
        response.content_type = Pinto::HTTP::ContentType::XHTML
        response.content_location = Pinto::Helper::URI.expand('signup_openid')
        response.body = view.render
        response
      end
    end
  end
end
