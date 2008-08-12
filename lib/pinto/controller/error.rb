module Pinto
  module Controller
    class Error
      def self.run(request, status_code, message = '')
        request = Pinto::HTTP::Request.new(request)
        status_code = Pinto::HTTP::StatusCode.new(status_code)
        message = Pinto::Error::Message.new(message)

        response = Pinto::HTTP::Response.new
        response.status_code = status_code
        response.content_type = 'text/plain'
        response.body = message
        return response
      end
    end
  end
end
