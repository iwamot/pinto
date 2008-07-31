# lib/pinto/model/user.rb

module Pinto
  module Model
    class User
      def self.add(user_name, claimed_id, lang)
        user_name = user_name.to_s

        if user_name.empty?
          translator = Pinto::Translate.new(lang)
          message = translator._('%{param} is required') % {
            :param => translator._('User name')
          }
          raise ArgumentError.new(message)
        end
      end
    end
  end
end
