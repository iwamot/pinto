# lib/pinto/controller/private/base.rb
module Pinto
  module Controller
    module Private
      module Base
        def run(request)
          unless request.is_a? Pinto::Request
            raise ArgumentError.new('request must be Pinto::Request')
          end
          if request.get? || request.head?
            method = 'get_action'
          elsif request.post?
            method = 'post_action'
          elsif request.put?
            method = 'put_action'
          elsif request.delete?
            method = 'delete_action'
          elsif request.options?
            method = 'options_action'
          end

          if self.methods.include? method
            return self.method(method).call(request)
          end

          http_status_code = Pinto::Type::HttpStatusCode.new(405)
          translator = Pinto::Translate.new(request.get_uri_map['lang'])
          message = translator._(
            'Requested HTTP method is invalid for this resource'
          )
          message = Pinto::Type::ErrorMessage.new(message)
          return Pinto::Controller::Private::Error.run(
            request, http_status_code, message
          )
        end

        def options_action(request)
          unless request.is_a? Pinto::Request
            raise ArgumentError.new('request must be Pinto::Request')
          end

          allowed_methods = []
          if self.methods.include? 'get_action'
            allowed_methods.push('GET')
            allowed_methods.push('HEAD')
          end
          if self.methods.include? 'post_action'
            allowed_methods.push('POST')
          end
          if self.methods.include? 'put_action'
            allowed_methods.push('PUT')
          end
          if self.methods.include? 'delete_action'
            allowed_methods.push('DELETE')
          end
          allowed_methods.push('OPTIONS')
          return [
            200,
            {
              'Allow' => allowed_methods.join(', '),
              'Content-Type' => ''
            },
            []
          ]
        end
      end
    end
  end
end
