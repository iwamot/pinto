module Pinto
  module HTTP
    class Response
      attr_accessor :status_code, :body
      attr_reader   :header

      def initialize
        @headers = {'Content-Type' => ''}
        @body = ''
      end

      def content_type=(content_type)
        @headers['Content-Type'] = content_type
      end

      def content_type
        @headers['Content-Type']
      end

      def location=(location)
        @headers['Location'] = location
      end

      def location
        @headers['Location']
      end

      def content_location=(content_location)
        @headers['Content-Location'] = content_location
      end

      def content_location
        @headers['Content-Location']
      end

      def for_rack
        headers = {}
        @headers.each do |key, value|
          headers[key] = value.to_s
        end
        [@status_code, headers, @body]
      end
    end
  end
end
