# lib/pinto/controller/index.rb

require 'pinto/config'
require 'pinto/view'

module Pinto
  module Controller
    class Index
      def self.run(request)
        request_lang = request['uri_map']['lang']
        languages = Pinto::Config.load('languages')

        if request_lang.empty?
          param = {
            :controller => 'index',
            :languages  => languages
          }
          response_body = Pinto::View.render('multiple', param)
          return [
            300,
            {'Content-Type' => 'application/xhtml+xml; charset=UTF-8'},
            [response_body]
          ]
        end

        other_languages = languages.delete_if do |lang|
          lang['code'] == request_lang
        end

        param = {
          :lang        => request_lang,
          :other_langs => other_languages
        }
        response_body = Pinto::View.render('index', param)

        return [
          200,
          {'Content-Type' => 'application/xhtml+xml; charset=UTF-8'},
          [response_body]
        ]
      end
    end
  end
end
