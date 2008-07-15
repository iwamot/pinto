# lib/pinto/dispatcher.rb

require 'addressable/uri'
require 'pinto/config'
require 'pinto/pathname'
require 'pinto/request'
require 'pinto/uri/extract_processor'

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
      return path.get_class.run(request)
    end
  end
end
