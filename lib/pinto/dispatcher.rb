# lib/pinto/dispatcher.rb

require 'addressable/uri'
require 'pinto/config'
require 'pinto/pathname'
require 'pinto/uri/extract_processor'
require 'rack'

module Pinto
  class Dispatcher
    def call(env)
      uri_templates = Pinto::Config.load('uri_templates')
      request = Rack::Request.new(env)
      controller, request[:uri_map] = extract(uri_templates, request.url)
      run_controller(controller, request)
    end

    def extract(uri_templates, request_uri)
      uri = Addressable::URI.parse(request_uri)
      uri_templates.each do |controller, template|
        param = uri.extract_mapping(template, Pinto::URI::ExtractProcessor)
        return [controller, param] unless param.nil?
      end
      ['not_found', {}]
    end

    def run_controller(controller, request)
      path = Pathname.new("pinto/controller/#{controller}")
      require path
      path.get_class.run(request)
    end
  end
end
