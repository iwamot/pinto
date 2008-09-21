$LOAD_PATH << 'lib'
$LOAD_PATH << '../pinto_beans/lib'

require 'pinto/spec/base'

module Pinto
  class IndexSpec < Pinto::Spec::Base
    def define
      @uri = 'http://pinto.jp/'
      @allowed_methods = ['GET', 'HEAD', 'OPTIONS']
    end
  end
end

spec = Pinto::IndexSpec.new
spec.run
