# lib/pinto/controller/private/error.rb

module Pinto
  module Controller
    module Private
      class Error
        def self.run(request, code, message = '')
          return [
            code,
            {'Content-Type' => 'text/plain'},
            [message]
          ]
        end
      end
    end
  end
end
