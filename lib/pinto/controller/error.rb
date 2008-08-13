module Pinto
  module Controller
    class Error
      def self.run(request, status_code, message = '')
        response = Pinto::HTTP::Response.new
        response.status_code = status_code
        response.content_type = Pinto::HTTP::ContentType::PLAIN
        response.body = message
        return response
      end
    end
  end
end
