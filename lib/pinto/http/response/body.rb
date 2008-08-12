module Pinto
  module HTTP
    class Response
      class Body
        def initialize(response_body)
          unless response_body.respond_to? :to_s
            raise TypeError.new('response_body must respond to #to_s')
          end

          @response_body = response_body.to_s
        end

        def to_s
          return @response_body
        end
      end
    end
  end
end
