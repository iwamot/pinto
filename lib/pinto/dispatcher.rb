module Pinto
  class Dispatcher
    def call(env)
      env = Pinto::Server::Environment.new(env)

      request = Pinto::HTTP::Request.new(env)
      if request.not_found?
        return Pinto::Controller::Error.run(request, 404).for_rack
      end

      return request.run.for_rack
    end
  end
end
