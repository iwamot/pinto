# lib/pinto.rb

require 'pathname'
require 'pinto/pathname'
require 'pinto/string'
require 'rubygems'

module Pinto
  VERSION = [0, 0, 1]

  def self.version
    return VERSION.join('.')
  end
end

autoload :DBI,  'dbi'
autoload :YAML, 'yaml'

gem 'activesupport'
require 'active_support'
Dependencies.load_paths << 'lib'

gem 'addressable'
module Addressable
  autoload :URI, 'addressable/uri'
end

gem 'erubis'
autoload :Erubis, 'erubis'

gem 'gettext'
autoload :GetText, 'gettext'

gem 'ruby-openid'
autoload :OpenID, 'openid'
module OpenID
  module Store
    autoload :Filesystem, 'openid/store/filesystem'
  end
end

gem 'rack'
autoload :Rack, 'rack'
