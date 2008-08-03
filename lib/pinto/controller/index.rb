# lib/pinto/controller/index.rb

module Pinto
  module Controller
    class Index
      include Pinto::Controller::Private::Base

      def get_action(request)
        unless request.is_a? Pinto::Request
          raise ArgumentError.new('request must be Pinto::Request')
        end

        request_lang = request.get_uri_map.to_hash['lang']
        if request_lang.empty?
          return Pinto::Controller::Private::Multiple.run(request)
        end

        base_lang = Pinto::Type::Language.new(request_lang)
        other_languages = Pinto::Language.others(base_lang)
        param = {
          :lang        => request_lang,
          :other_langs => other_languages
        }

        view_name  = Pinto::Type::ViewName.new('index')
        view_param = Pinto::Type::ViewParam.new(param)
        response_body = Pinto::View.render(view_name, view_param)

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
