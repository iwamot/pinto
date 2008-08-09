# lib/pinto/helper/uri.rb
module Pinto
  module Helper
    module URI
      module_function

      def uri(controller_name, param = {})
        unless controller_name.is_a? String
          raise ArgumentError.new('controller_name must be String')
        end
        unless param.is_a? Hash
          raise ArgumentError.new('param must be Hash')
        end

        config_key = Pinto::Type::ConfigKey.new('uri_templates')
        uri_templates = Pinto::Config.load(config_key)

        return Addressable::URI.expand_template(
          uri_templates[controller_name],
          param,
          Pinto::URI::ExpandProcessor
        ).to_s
      end
    end
  end
end
