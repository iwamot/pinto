module Pinto
  module Controller
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

        request.method_not_allowed
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

        response = Pinto::HTTP::Response.new
        response.status_code = Pinto::HTTP::StatusCode::OK
        response.allow = allowed_methods.join(', ')
        response
      end
    end
  end
end
