module Pinto
  module Controller
    class Multiple
      def self.run(request)
        request = Pinto::HTTP::Request.new(request)

        view = Pinto::View.new
        view.name = 'multiple'
        view.set_parameter(:requested_controller_name,
                           request.controller_name)
        view.set_parameter(:locales, Pinto::Locale.list)
        view.set_parameter(:uri_parameters, request.uri_parameters)

        response = Pinto::HTTP::Response.new
        response.status_code = 300
        response.content_type = 'application/xhtml+xml; charset=UTF-8'
        response.body = view.render
        return response
      end
    end
  end
end
