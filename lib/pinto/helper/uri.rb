module Pinto
  module Helper
    module URI
      module_function

      def expand(controller_name, uri_parameters = {})
        controller_name = Pinto::Controller::Name.new(controller_name)
        uri_parameters = Pinto::URI::Parameters.new(uri_parameters)

        uri_templates = Pinto::Config.uri_templates
        return Pinto::URI.new(Addressable::URI.expand_template(
          uri_templates.template(controller_name).to_s,
          uri_parameters.to_hash,
          Pinto::URI::ExpandProcessor
        ))
      end

      alias uri expand
    end
  end
end
