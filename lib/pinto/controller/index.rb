# lib/pinto/controller/index.rb

require 'pinto/controller/multiple'
require 'pinto/helper/uri'
require 'pinto/language'
require 'pinto/view'

module Pinto
  module Controller
    class Index
      def self.run(request)
        request_lang = request.uri_map['lang']
        if request_lang.empty?
          return Pinto::Controller::Multiple.run(request)
        end

        other_languages = Pinto::Language.get_other(request_lang)
        param = {
          :lang        => request_lang,
          :other_langs => other_languages
        }

        response_body = Pinto::View.render('index', param)

        platonic_uri = Pinto::Helper::URI.uri('index')

        return [
          200,
          {
            'Content-Type'     => 'application/xhtml+xml; charset=UTF-8',
            'Content-Location' => platonic_uri
          },
          [response_body]
        ]
      end
    end
  end
end
