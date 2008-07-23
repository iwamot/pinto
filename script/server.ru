# script/server.ru

#use Rack::Session::Cookie, :key => 'rack.session',
#                           :domain => 'pinto.jp',
#                           :path => '/',
#                           :expire_after => 60 * 60 * 24 * 30

use Rack::Reloader, 1

$LOAD_PATH << 'lib'
require 'pinto'
run Pinto::Dispatcher.new
