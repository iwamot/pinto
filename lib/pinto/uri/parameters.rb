module Pinto
  class URI
    class Parameters
      def initialize(uri_parameters)
        @uri_parameters = uri_parameters.to_hash
      end

      def to_hash
        return @uri_parameters
      end

      def empty?
        return @uri_parameters.empty?
      end

      def locale_code=(locale_code)
        @uri_parameters['locale_code'] = Pinto::Locale::Code.new(locale_code)
      end

      def locale_code
        return @uri_parameters['locale_code']
      end
    end
  end
end
