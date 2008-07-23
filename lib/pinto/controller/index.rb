# lib/pinto/controller/index.rb

module Pinto
  module Controller
    class Index
      include Pinto::Controller::Private::Base

      def get_action(request)
        request_lang = request.uri_map['lang']
        if request_lang.empty?
          return Pinto::Controller::Private::Multiple.run(request)
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
