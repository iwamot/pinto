# lib/pinto/controller/top.rb

require 'pinto/controller/multiple'

module Pinto
  module Controller
    class Top
      def self.run(request)
        request.controller = 'index'
        return Pinto::Controller::Multiple.run(request)
      end
    end
  end
end
