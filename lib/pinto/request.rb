# lib/pinto/request.rb

module Pinto
  class Request < Rack::Request
    def initialize(env)
      unless env.is_a? Hash
        raise ArgumentError.new('env must be Hash')
      end

      controller_name = Pinto::Type::ControllerName.new('')
      self.set_controller_name(controller_name)

      uri_map = Pinto::Type::UriMap.new({})
      self.set_uri_map(uri_map)

      super(env)
    end

    def set_controller_name(controller_name)
      unless controller_name.is_a? Pinto::Type::ControllerName
        raise ArgumentError.new(
          'controller_name must be Pinto::Type::ControllerName'
        )
      end

      @controller_name = controller_name
    end

    def get_controller_name
      return @controller_name
    end

    def set_uri_map(uri_map)
      unless uri_map.is_a? Pinto::Type::UriMap
        raise ArgumentError.new('uri_map must be Pinto::Type::UriMap')
      end

      @uri_map = uri_map
    end

    def get_uri_map
      return @uri_map
    end

    def head?
      return (request_method == 'HEAD')
    end

    def options?
      return (request_method == 'OPTIONS')
    end
  end
end
