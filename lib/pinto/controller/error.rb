# lib/pinto/controller/error.rb

module Pinto
  module Controller
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
