# lib/pinto/controller/signup_account.rb

require 'pinto/encoding'
require 'pinto/view'

module Pinto
  class Controller
    class SignupAccount
      def self.run(request)
        param = {:str => request.params}
        response_body = Pinto::View.render('top', param)

        [
          200,
          {'Content-Type' => 'text/html; charset=UTF-8'},
          [response_body]
        ]
      end
    end
  end
end
