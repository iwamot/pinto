# lib/pinto/controller/private/error.rb

module Pinto
  module Controller
    module Private
      class Error
        def self.run(request, code)
          return [
            code,
            {'Content-Type' => ''},
            []
          ]
        end
      end
    end
  end
end
