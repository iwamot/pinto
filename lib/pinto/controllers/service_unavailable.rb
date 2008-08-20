# Controller

module Pinto
  class ServiceUnavailableController
    def run(request, route, response)
      response.status_code = 503
      response.headers = {'Content-Type' => 'text/plain; charset=UTF-8'}
      response.body = 'Pinto: 503 Service Unavailable'
      response
    end
  end
end
