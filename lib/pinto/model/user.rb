# lib/pinto/model/user.rb
module Pinto
  module Model
    class User
      def self.add(user_name, claimed_id)
        unless user_name.is_a? Pinto::Type::UserName
          raise ArgumentError.new('user_name must be Pinto::Type::UserName')
        end
        unless claimed_id.is_a? Pinto::Type::ClaimedID
          raise ArgumentError.new('claimed_id must be Pinto::Type::ClaimedID')
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
          raise ArgumentError.new(message)
        end

        open_id = open_id.to_s
        if open_id.empty?
          translator = Pinto::Translator.new(lang)
          message = translator._('%{param} is required') % {
            :param => 'OpenID'
          }
          raise ArgumentError.new(message)
        end
      end
=end
    end
  end
end
