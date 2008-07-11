# lib/pinto/controller/index.rb

require 'pinto/config'
require 'pinto/view'

module Pinto
  module Controller
    class Index
      def self.run(request)
        param = {
          :lang => request['uri_map']['lang']
        }

        response_body = Pinto::View.render('index', param)

        return [
          200,
          {'Content-Type' => 'text/html; charset=UTF-8'},
          [response_body]
        ]
      end
    end
  end
end
