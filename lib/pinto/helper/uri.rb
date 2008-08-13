module Pinto
  module Helper
    module URI
      module_function

      def expand(controller_name, uri_parameters = {})
        Addressable::URI.expand_template(
          Pinto::Config.uri_templates[controller_name],
          uri_parameters,
          Pinto::URI::ExpandProcessor
        ).to_s
      end

      alias uri expand
    end
  end
end
