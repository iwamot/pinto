# lib/pinto/controller/users.rb

module Pinto
  module Controller
    class Users
      include Pinto::Controller::Private::Base

      def post_action(request)
        request_lang = request.uri_map['lang']
        user_name    = request.POST['user_name']
        claimed_id   = request.POST['claimed_id']

        begin
          Pinto::Model::User.add(user_name, claimed_id, request_lang)
        rescue => e
          other_languages = Pinto::Language.get_other(request_lang)
          param = {
            :lang          => request_lang,
            :user_name     => user_name,
            :claimed_id    => claimed_id,
            :error_message => e.message
          }
          response_body = Pinto::View.render('signup_account', param)

          return [
            400,
            {'Content-Type' => 'application/xhtml+xml; charset=UTF-8'},
            [response_body]
          ]
        end

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
