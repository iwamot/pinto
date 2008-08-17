# script/server.ru

$LOAD_PATH << 'lib'
require 'pinto'

use Rack::CommonLogger, STDERR
use Rack::ShowExceptions
use Rack::Reloader, 1
use Rack::Lint

run PintoBeans::RackInterfacer.new
