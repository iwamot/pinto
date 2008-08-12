module Pinto
  class URI
    def initialize(uri)
      @uri = uri.to_s
    end

    def extract_mapping(uri_template)
      uri_template = Pinto::URI::Template.new(uri_template)

      uri_parameters = Addressable::URI.parse(@uri).extract_mapping(
        uri_template.to_s, Pinto::URI::ExtractProcessor
      )
      return Pinto::URI::Parameters.new(uri_parameters)
    end

    def to_s
      return @uri
    end
  end
end
