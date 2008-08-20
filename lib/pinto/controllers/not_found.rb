# Controller

module Pinto
  class NotFoundController
    def run(request, route, response)
      response.status_code = 404
      response.headers = {'Content-Type' => 'text/plain; charset=UTF-8'}
      response.body = 'Pinto: 404 Not Found'
      response
    end
  end
end
