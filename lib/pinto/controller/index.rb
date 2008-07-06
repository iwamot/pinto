# lib/pinto/controller/top.rb

require 'pinto/view'

module Pinto
  module Controller
    class Top
      def self.run(request)
        param = {
          :greeting => '"<こんにちはRuby>"',
          :color    => 'red',
          :address  => '<address>id:IwamotoTakashi</address>'
        }
        response_body = Pinto::View.render('top', param)

        return [
          200,
          {'Content-Type' => 'text/html; charset=UTF-8'},
          [response_body]
        ]
      end
    end
  end
end
