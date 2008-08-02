# lib/pinto/controller/private/error.rb

module Pinto
  module Controller
    module Private
      class Error
        def self.run(request, code, message = Pinto::Type::ErrorMessage.new(''))
          unless request.is_a? Pinto::Request
            raise ArgumentError.new('request must be Pinto::Request')
          end
          unless code.is_a? Pinto::Type::HttpStatusCode
            raise ArgumentError.new('code must be Pinto::Type::HttpStatusCode')
          end
          unless message.is_a? Pinto::Type::ErrorMessage
            raise ArgumentError.new('message must be Pinto::Type::ErrorMessage')
          end

          return [
            code.to_i,
            {'Content-Type' => 'text/plain'},
            [message.to_s]
          ]
        end
      end
    end
  end
end
