module Pinto
  module HTTP
    class Request
      def initialize(env)
        env = Pinto::Server::Environment.new(env)

        self.env = env
        self.controller_name = ''
        self.uri_parameters = {}

        Pinto::Config.uri_templates.each do |uri_templates_record|
          uri_parameters = self.uri.extract_mapping(
            uri_templates_record.uri_template
          )

          unless uri_parameters.empty?
            self.controller_name = uri_templates_record.controller_name
            self.uri_parameters = uri_parameters
            break
          end
        end
      end

      def env=(env)
        @env = Pinto::Server::Environment.new(env)
      end

      def env
        return @env
      end

      def to_hash
        return @env.to_hash
      end

      def controller_name=(controller_name)
        @controller_name = Pinto::Controller::Name.new(controller_name)
      end

      def controller_name
        return @controller_name
      end

      def uri_parameters=(uri_parameters)
        @uri_parameters = Pinto::URI::Parameters.new(uri_parameters)
      end

      def uri_parameters
        return @uri_parameters
      end

      def uri
        return Pinto::URI.new(Addressable::URI.parse(self.request.url))
      end

      def request
        return Rack::Request.new(self.env.to_hash)
      end

      def not_found?
        return (self.controller_name == '')
      end

      def no_locale?
        return self.locale_code.empty?
      end

      def locale_code
        return self.uri_parameters.locale_code
      end

      def get?
        return self.request.get?
      end

      def post?
        return self.request.post?
      end

      def head?
        return (self.request.request_method == 'HEAD')
      end

      def options?
        return (self.request.request_method == 'OPTIONS')
      end

      def query(key)
        return self.request.GET[key.to_s]
      end

      def posted(key)
        return self.request.POST[key.to_s]
      end

      def run
        return Pathname.new("pinto/controller/#{self.controller_name}"
                           ).get_class.new.run(self)
      end

      def query_strings
        return Pinto::URI::QueryStrings.new(self.request.GET)
      end
    end
  end
end
