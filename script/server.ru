# script/server.ru

$LOAD_PATH << '../lib'
require 'pinto/dispatcher'
run Pinto::Dispatcher.new
