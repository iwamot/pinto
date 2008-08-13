module Pinto
  module Controller
    class Index
      include Pinto::Controller::Base

      def get_action(request)
        return request.multiple if request.no_locale?

        view = Pinto::View.new('index')
        view.set_parameter(:locale_code, request.locale_code)
        view.set_parameter(:other_locales,
                           Pinto::Locale.others(request.locale_code))

        response = Pinto::HTTP::Response.new
        response.status_code = Pinto::HTTP::StatusCode::OK
        response.content_type = Pinto::HTTP::ContentType::XHTML
        response.content_location = Pinto::Helper::URI.expand('index')
        response.body = view.render
        response
      end
    end
  end
end
