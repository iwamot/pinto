# lib/pinto/controller/private/multiple.rb

module Pinto
  module Controller
    module Private
      class Multiple
        def self.run(request)
          unless request.is_a? Pinto::Request
            raise ArgumentError.new('request must be Pinto::Request')
          end

          languages = Pinto::Language.list
          uri_map = request.get_uri_map.to_hash
          uri_map.delete('lang')

          param = {
            :controller => request.get_controller_name.to_s,
            :languages  => languages,
            :uri_map    => uri_map
          }

          view_name  = Pinto::Type::ViewName.new('multiple')
          view_param = Pinto::Type::ViewParam.new(param)
          response_body = Pinto::View.render(view_name, view_param)

          return [
            300,
            {'Content-Type' => 'application/xhtml+xml; charset=UTF-8'},
            [response_body]
          ]
        end
      end
    end
  end
end
