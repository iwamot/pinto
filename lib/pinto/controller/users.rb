module Pinto
  module Controller
    class Users
      include Pinto::Controller::Base

      def post_action(request)







        response = Pinto::HTTP::Response.new
        response.status_code = Pinto::HTTP::StatusCode::CREATED
        response.location = Pinto::Helper::URI.expand(
          'user', 'locale_code' => request.locale_code,
                  'user_name'   => request.posted('user_name')
        )
        response
      end
    end
  end
end
