# Controller

module Pinto
  class MethodNotAllowedController
    def run(request, route, response)
      response.status_code = 405
      response.headers = {'Content-Type' => 'text/plain; charset=UTF-8'}
      response.body = 'Pinto: 405 Method Not Allowed'
      response
    end
  end
end
