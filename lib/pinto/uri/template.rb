module Pinto
  class URI
    class Template
      def initialize(uri_template)
        unless uri_template.respond_to? :to_s
          raise TypeError.new('uri_template must respond to #to_s')
        end

        @uri_template = uri_template.to_s
      end

      def to_s
        return @uri_template
      end
    end
  end
end
