module Pinto
  class Dispatcher
    def call(env)
      Pinto::HTTP::Request.dispatch(env).for_rack
    end
  end
end
