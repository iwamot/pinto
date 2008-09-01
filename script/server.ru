use Rack::CommonLogger, STDERR
use Rack::ShowExceptions
use Rack::Reloader, 1
use Rack::Lint
use Rack::Deflater

require 'pinto_beans'
run PintoBeans::RackHandler.new
