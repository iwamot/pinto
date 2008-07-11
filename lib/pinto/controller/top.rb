# lib/pinto/controller/top.rb

require 'pinto/config'
require 'pinto/view'

module Pinto
  module Controller
    class Top
      def self.run(request)
        param = {
          :languages => Pinto::Config.load('languages')
        }

        response_body = Pinto::View.render('top', param)

        return [
          300,
          {'Content-Type' => 'application/xhtml+xml; charset=UTF-8'},
          [response_body]
        ]
      end
    end
  end
end
