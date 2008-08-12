module Pinto
  module Controller
    class Index
      include Pinto::Controller::Base

      def get_action(request)
        request = Pinto::HTTP::Request.new(request)

        if request.no_locale?
          return Pinto::Controller::Multiple.run(request)
        end

        view = Pinto::View.new
        view.name = 'index'
        view.set_parameter(:locale_code, request.locale_code)
        view.set_parameter(:other_locales,
                           Pinto::Locale.others(request.locale_code))

        response = Pinto::HTTP::Response.new
        response.status_code = 200
        response.content_type = 'application/xhtml+xml; charset=UTF-8'
        response.content_location = Pinto::Helper::URI.expand('index')
        response.body = view.render
        return response
      end
    end
  end
end
