# lib/pinto/dispatcher.rb
module Pinto
  class Dispatcher
    def call(env)
      unless env.is_a? Hash
        raise ArgumentError.new('env must be Hash')
      end
      request = Pinto::Request.new(env)
      uri = Addressable::URI.parse(request.url)

      config_key = Pinto::Type::ConfigKey.new('uri_templates')
      Pinto::Config.load(config_key).each do |controller, template|
        uri_map = uri.extract_mapping(template, Pinto::URI::ExtractProcessor)
        unless uri_map.nil?
          controller_name = Pinto::Type::ControllerName.new(controller)
          request.set_controller_name(controller_name)

          uri_map = Pinto::Type::UriMap.new(uri_map)
          request.set_uri_map(uri_map)
          break
        end
      end

      if request.get_controller_name.to_s.empty?
        http_status_code = Pinto::Type::HttpStatusCode.new(404)
        return Pinto::Controller::Private::Error.run(request, http_status_code)
      end

      controller_name = request.get_controller_name.to_s
      path = Pathname.new("pinto/controller/#{controller_name}")
      return path.get_class.new.run(request)

=begin
    rescue => exception
      http_status_code = Pinto::Type::HttpStatusCode.new(500)
      translator = Pinto::Translater.new(request.get_uri_map['lang'])
#      message = translator._('Server error occurred')
      message = Pinto::Type::ErrorMessage.new(exception.message)
      return Pinto::Controller::Private::Error.run(
        request, http_status_code, message
      )
=end
    end
  end
end
