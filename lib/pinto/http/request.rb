module Pinto
  module HTTP
    class Request
      attr_reader :controller_name, :uri_parameters

      def self.dispatch(env)
        request = self.new(env)
        request.not_found? ? request.not_found : request.run
      end

      def initialize(env)
        @request = Rack::Request.new(env)
        @controller_name = ''
        @uri_parameters = {}

        Pinto::Config.uri_templates.each do |controller_name, uri_template|
          uri_parameters = Pinto::URI.extract(self.uri, uri_template)
          unless uri_parameters.nil?
            @controller_name = controller_name
            @uri_parameters = uri_parameters
            break
          end
        end
      end

      def get?
        @request.get?
      end

      def post?
        @request.post?
      end

      def put?
        @request.request_method == 'PUT'
      end

      def delete?
        @request.request_method == 'DELETE'
      end

      def head?
        @request.request_method == 'HEAD'
      end

      def options?
        @request.request_method == 'OPTIONS'
      end

      def not_found
        self.error(Pinto::HTTP::StatusCode::NOT_FOUND)
      end

      def multiple
        Pinto::Controller::Multiple.run(self)
      end

      def method_not_allowed
        self.error(
          Pinto::HTTP::StatusCode::METHOD_NOT_ALLOWED,
          self._('Requested HTTP method is invalid for this resource')
        )
      end

      def bad_request(message)
        self.error(Pinto::HTTP::StatusCode::BAD_REQUEST, message)
      end

      def error(status_code, message = '')
        Pinto::Controller::Error.run(self, status_code, message)
      end

      def run
        Class.create("Pinto::Controller::#{@controller_name.camelize}"
                    ).run(self)
      end

      def uri
        @request.url
      end

      def locale_code
        @uri_parameters['locale_code']
      end

      def query(key)
        @request.GET[key]
      end

      def posted(key)
        @request.POST[key]
      end

      def query_strings
        @request.GET
      end

      def no_locale?
        self.locale_code.empty?
      end

      def not_found?
        @controller_name == ''
      end

      def _(message_id)
        Pinto::Translator.new(self.locale_code)._(message_id)
      end
    end
  end
end
