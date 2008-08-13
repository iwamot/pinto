module Pinto
  module Controller
    class Multiple
      def self.run(request)
        view = Pinto::View.new('multiple')
        view.set_parameter(:requested_controller_name, request.controller_name)
        view.set_parameter(:locales, Pinto::Locale.list)
        view.set_parameter(:uri_parameters, request.uri_parameters)

        response = Pinto::HTTP::Response.new
        response.status_code = Pinto::HTTP::StatusCode::MULTIPLE_CHOICES
        response.content_type = Pinto::HTTP::ContentType::XHTML
        response.body = view.render
        response
      end
    end
  end
end
