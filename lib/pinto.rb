# lib/pinto.rb

require 'pathname'
require 'pinto/pathname'
require 'pinto/string'
require 'rubygems'

autoload :DBI,  'dbi'
autoload :YAML, 'yaml'

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

module Pinto
  autoload :Config,     'pinto/config'
  autoload :Dispatcher, 'pinto/dispatcher'
  autoload :Language,   'pinto/language'
  autoload :OpenID,     'pinto/open_id'
  autoload :Request,    'pinto/request'
  autoload :Translate,  'pinto/translate'
  autoload :View,       'pinto/view'

  module Controller
=begin
    autoload :Index,         'pinto/controller/index'
    autoload :SignupAccount, 'pinto/controller/signup_account'
    autoload :SignupAuth,    'pinto/controller/signup_auth'
    autoload :SignupOpenid,  'pinto/controller/signup_openid'
=end

    module Private
      autoload :Base,     'pinto/controller/private/base'
      autoload :Error,    'pinto/controller/private/error'
      autoload :Multiple, 'pinto/controller/private/multiple'
    end
  end

  module Encoding
    autoload :UTF8, 'pinto/encoding/utf8'
  end

  module Helper
    autoload :HTML,      'pinto/helper/html'
    autoload :Translate, 'pinto/helper/translate'
    autoload :URI,       'pinto/helper/uri'
  end

  module Model
    autoload :SignupReservation, 'pinto/model/signup_reservation'
    autoload :User,              'pinto/model/user'
  end

  module Type
    autoload :ClaimedID,      'pinto/type/claimed_id'
    autoload :ConfigKey,      'pinto/type/config_key'
    autoload :ControllerName, 'pinto/type/controller_name'
    autoload :EscapeChars,    'pinto/type/escape_chars'
    autoload :ErrorMessage,   'pinto/type/error_message'
    autoload :HttpStatusCode, 'pinto/type/http_status_code'
    autoload :Language,       'pinto/type/language'
    autoload :QueryStrings,   'pinto/type/query_strings'
    autoload :URI,            'pinto/type/uri'
    autoload :UriMap,         'pinto/type/uri_map'
    autoload :UserName,       'pinto/type/user_name'
    autoload :UserSuppliedID, 'pinto/type/user_supplied_id'
    autoload :ViewName,       'pinto/type/view_name'
    autoload :ViewParam,      'pinto/type/view_param'
  end

  module URI
    autoload :ExpandProcessor,  'pinto/uri/expand_processor'
    autoload :ExtractProcessor, 'pinto/uri/extract_processor'
  end

  class View
    autoload :XHTML, 'pinto/view/xhtml'
  end
end

gem 'rack'
autoload :Rack, 'rack'
