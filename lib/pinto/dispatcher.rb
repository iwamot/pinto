# lib/pinto/dispatcher.rb

module Pinto
  class Dispatcher
    def call(env)
      request = Pinto::Request.new(env)
      uri = Addressable::URI.parse(request.url)

      Pinto::Config.load('uri_templates').each do |controller, template|
        uri_map = uri.extract_mapping(template, Pinto::URI::ExtractProcessor)
        unless uri_map.nil?
          request.controller = controller
          request.uri_map    = uri_map
          break
        end
      end

      path = Pathname.new("pinto/controller/#{request.controller}")
      require path
      return path.get_class.new.run(request)
=begin
    rescue => exception
      translator = Pinto::Translate.new(request.uri_map['lang'])
      message = translator._('Server error occurred')
      message = exception.message
      return Pinto::Controller::Private::Error.run(request, 500, message)
=end
    end
  end
end
