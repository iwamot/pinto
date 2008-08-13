module Pinto
  module URI
    def self.extract(uri, uri_template)
      Addressable::URI.parse(uri).extract_mapping(
        uri_template, Pinto::URI::ExtractProcessor
      )
    end
  end
end
