# lib/pinto/controller/top.rb

require 'pinto/view'

module Pinto
  module Controller
    class Top
      def self.run(request)
        response_body = Pinto::View.render('top')

        return [
          300,
          {'Content-Type' => 'application/xhtml+xml; charset=UTF-8'},
          [response_body]
        ]
      end
    end
  end
end
