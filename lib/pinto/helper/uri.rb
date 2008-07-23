# lib/pinto/helper/uri.rb

module Pinto
  module Helper
    module URI
      module_function

      def uri(controller, param = {})
        uri_templates = Pinto::Config.load('uri_templates')
        return Addressable::URI.expand_template(
          uri_templates[controller],
          param,
          Pinto::URI::ExpandProcessor
        ).to_s
      end
    end
  end
end
