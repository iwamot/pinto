# lib/pinto/controller/multiple.rb

require 'pinto/config'
require 'pinto/view'

module Pinto
  module Controller
    class Multiple
      def self.run(request)
        languages = Pinto::Config.load('languages')
        uri_map = request.uri_map
        uri_map.delete('lang')

        param = {
          :controller => request.controller,
          :languages  => languages,
          :uri_map    => uri_map
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
