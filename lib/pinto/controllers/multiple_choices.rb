# Controller

module Pinto
  class MultipleChoicesController
    def run(request, route, response)
      response.status_code = 300
      response.headers = {'Content-Type' => 'text/plain; charset=UTF-8'}
      response.body = 'Pinto: 300 Multiple Choices'
      response
    end
  end
end
