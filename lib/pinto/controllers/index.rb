# Controller

module Pinto
  class IndexController
=begin
    def not_found?(request, route)
      false
    end

    def unauthorized?(request, route)
      false
    end
=end

    attr_reader :support_multiple_choices

    def initialize
      @support_multiple_choices = true
    end

    def get_action(request, route, response)
      response.status_code = 200
      response.headers = {'Content-Type' => 'text/plain; charset=UTF-8'}
      response.body = 'Pinto: 200 OK'
      response
    end
  end
end
