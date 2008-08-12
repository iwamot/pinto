module Pinto
  module HTTP
    class Response
      def initialize
        @headers = {'Content-Type' => ''}
      end

      def status_code=(status_code)
        @status_code = Pinto::HTTP::StatusCode.new(status_code)
      end

      def status_code
        return @status_code
      end

      def content_type=(content_type)
        @headers['Content-Type'] = content_type.to_s
      end

      def content_type
        return @headers['Content-Type']
      end

      def location=(location)
        @headers['Location'] = location.to_s
      end

      def location
        return @headers['Location']
      end

      def content_location=(content_location)
        @headers['Content-Location'] = Pinto::URI.new(content_location)
      end

      def content_location
        return @headers['Content-Location']
      end

      def body=(response_body)
        @response_body = Pinto::HTTP::Response::Body.new(response_body)
      end

      def body
        @response_body
      end

      def headers
        return @headers
      end

      def for_rack
        headers = {}

        self.headers.each do |key, value|
          headers[key] = value.to_s
        end

        return [
          self.status_code.to_i,
          headers,
          self.body.to_s
        ]
      end
    end
  end
end
