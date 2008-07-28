# lib/pinto/request.rb

module Pinto
  class Request < Rack::Request
    attr_accessor :controller
    attr_accessor :uri_map

    def initialize(env)
      @controller = nil
      @uri_map    = {}
      super(env)
    end

    def head?
      return (request_method == 'HEAD')
    end

    def options?
      return (request_method == 'OPTIONS')
    end
  end
end
