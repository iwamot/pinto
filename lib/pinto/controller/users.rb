# lib/pinto/controller/users.rb

module Pinto
  module Controller
    class Users
      include Pinto::Controller::Private::Base

      def post_action(request)
        unless request.is_a? Pinto::Request
          raise ArgumentError.new('request must be Pinto::Request')
        end

        request_lang = request.get_uri_map.to_hash['lang']
        user_name    = request.POST['user_name']
        claimed_id   = request.POST['claimed_id']

=begin
        begin
          Pinto::Model::User.add(user_name, claimed_id)
        rescue => e
          base_lang = Pinto::Type::Language.new(request_lang)
          other_languages = Pinto::Language.others(base_lang)
          param = {
            :lang          => request_lang,
            :user_name     => user_name,
            :claimed_id    => claimed_id,
            :error_message => e.message
          }

          view_name  = Pinto::Type::ViewName.new('signup_account')
          view_param = Pinto::Type::ViewParam.new(param)
          response_body = Pinto::View.render(view_name, view_param)

          return [
            400,
            {'Content-Type' => 'application/xhtml+xml; charset=UTF-8'},
            [response_body]
          ]
        end
=end

        param = {
          'lang'      => request_lang,
          'user_name' => user_name
        }
        redirect_uri = Pinto::Helper::URI.uri('user', param)

        return [
          201,
          {'Location' => redirect_uri, 'Content-Type' => ''},
          []
        ]
      end
    end
  end
end
