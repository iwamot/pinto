module Pinto
  module Model
    class User
      def self.add(user_name, claimed_id)
        unless user_name.is_a? Pinto::User::Name
          raise TypeError.new('user_name must be Pinto::User::Name')
        end
        unless claimed_id.is_a? Pinto::OpenID::ClaimedID
          raise TypeError.new('claimed_id must be Pinto::OpenID::ClaimedID')
        end
      end
=begin
      def self.add(user_name, open_id, lang)
        user_name = user_name.to_s
        if user_name.empty?
          translator = Pinto::Translator.new(lang)
          message = translator._('%{param} is required') % {
            :param => translator._('User name')
          }
          raise TypeError.new(message)
        end

        open_id = open_id.to_s
        if open_id.empty?
          translator = Pinto::Translator.new(lang)
          message = translator._('%{param} is required') % {
            :param => 'OpenID'
          }
          raise TypeError.new(message)
        end
      end
=end
    end
  end
end
