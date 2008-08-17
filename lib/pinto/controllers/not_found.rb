# Controller

module Pinto
  class NotFoundController
    include PintoBeans::BaseController

    def run
      response = PintoBeans::HttpResponse.new
      response.status_code = 404
      response.headers = {'Content-Type' => 'text/html; charset=UTF-8'}
      response.body = 'Not Found'
      response
    end
  end
end
