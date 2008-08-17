# Controller

module Pinto
  class IndexController
    include PintoBeans::BaseController

    def run
      response = PintoBeans::HttpResponse.new
      response.status_code = 200
      response.headers = {'Content-Type' => 'text/html; charset=UTF-8'}
      response.body = self.inspect
      response
    end
  end
end
