# lib/pinto/controller/private/base.rb

module Pinto
  module Controller
    module Private
      module Base
        def run(request)
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

          translator = Pinto::Translate.new(request.uri_map['lang'])
          message = translator._(
            'Requested HTTP method is invalid for this resource'
          )
          return Pinto::Controller::Private::Error.run(request, 405, message)
        end

        def options_action(request)
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
