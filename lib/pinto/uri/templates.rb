module Pinto
  class URI
    class Templates
      def initialize
        @uri_templates = []
      end

      def add(controller_name, uri_template)
        controller_name = Pinto::Controller::Name.new(controller_name)
        uri_template = Pinto::URI::Template.new(uri_template)

        @uri_templates.push(
          Pinto::URI::Templates::Record.new(controller_name, uri_template)
        )
      end

      def to_a
        return @uri_templates
      end

      def each
        @uri_templates.each do |item|
          yield item
        end
      end

      def template(controller_name)
        controller_name = Pinto::Controller::Name.new(controller_name)

        self.each do |uri_templates_record|
          if uri_templates_record.controller_name == controller_name
            return uri_templates_record.uri_template
          end
        end
      end
    end
  end
end
