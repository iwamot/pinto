module Pinto
  module Controller
    class Users
      include Pinto::Controller::Base

      def post_action(request)
        request = Pinto::HTTP::Request.new(request)






        response = Pinto::HTTP::Response.new
        response.status_code = 201
        response.location = Pinto::Helper::URI.expand(
          'user', 'locale_code' => request.locale_code,
                  'user_name'   => request.posted('user_name')
        )
        return response
      end
    end
  end
end
