module Pinto
  class URI
    class Templates
      class Record
        def initialize(controller_name, uri_template)
          controller_name = Pinto::Controller::Name.new(controller_name)
          uri_template = Pinto::URI::Template.new(uri_template)

          @controller_name = controller_name
          @uri_template = uri_template
        end

        def controller_name
          return @controller_name
        end

        def uri_template
          return @uri_template
        end
      end
    end
  end
end
