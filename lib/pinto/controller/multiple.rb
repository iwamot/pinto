# lib/pinto/controller/multiple.rb

require 'pinto/config'
require 'pinto/view'

module Pinto
  module Controller
    class Multiple
      def self.run(request)
        languages = Pinto::Config.load('languages')

        param = {
          :controller => request.controller,
          :languages  => languages
        }

        response_body = Pinto::View.render('multiple', param)

        return [
          300,
          {'Content-Type' => 'application/xhtml+xml; charset=UTF-8'},
          [response_body]
        ]
      end
    end
  end
end
