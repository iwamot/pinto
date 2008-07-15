# lib/pinto/request.rb

require 'rack'

module Pinto
  class Request < Rack::Request
    attr_accessor :controller
    attr_accessor :uri_map

    def initialize(env)
      @controller = 'not_found'
      @uri_map    = {}
      super(env)
    end
  end
end
