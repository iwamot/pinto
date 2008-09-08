$spec = {}
$spec[:allowed_methods]  = 'GET, HEAD, OPTIONS'
$spec[:host]             = 'pinto.jp'
$spec[:path]             = '/'
$spec[:multiple_choices] = true
$spec[:content_type]     = 'XHTML'
$spec[:expires]          = 60 * 60 * 6

$LOAD_PATH << '../'
require 'pinto_beans/spec/restful'
