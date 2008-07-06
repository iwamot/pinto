# lib/pinto/view/helper/uri.rb

require 'addressable/uri'
require 'pinto/config'
require 'pinto/uri/expand_processor'

module Pinto
  class View
    class Helper
      module URI
        def uri(controller, param)
          uri_templates = Pinto::Config.load('uri_templates')
          return Addressable::URI.expand_template(uri_templates[controller],
                                                  param,
                                                  Pinto::URI::ExpandProcessor)
        end
      end
    end
  end
end
