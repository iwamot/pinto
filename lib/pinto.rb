require 'pathname'
require 'pinto/core_ext/nil'
require 'pinto/core_ext/pathname'
require 'pinto/core_ext/string'

module Pinto
  def self.version
    return '0.0.1'
  end

  autoload :Characters, 'pinto/characters'
  autoload :Config, 'pinto/config'
  autoload :Dispatcher, 'pinto/dispatcher'
  autoload :Locale, 'pinto/locale'
  autoload :OpenID, 'pinto/open_id'
  autoload :Translator, 'pinto/translator'
  autoload :URI, 'pinto/uri'
  autoload :View, 'pinto/view'

  class Config
    autoload :DB, 'pinto/config/db'
    autoload :Key, 'pinto/config/key'
  end

  module Controller
    autoload :Base, 'pinto/controller/base'
    autoload :Error, 'pinto/controller/error'
    autoload :Index, 'pinto/controller/index'
    autoload :Multiple, 'pinto/controller/multiple'
    autoload :Name, 'pinto/controller/name'
    autoload :SignupAccount, 'pinto/controller/signup_account'
    autoload :SignupAuth, 'pinto/controller/signup_auth'
    autoload :SignupOpenid, 'pinto/controller/signup_openid'
    autoload :User, 'pinto/controller/user'
    autoload :Users, 'pinto/controller/users'
  end

  module DB
    autoload :Host, 'pinto/db/host'
    autoload :Name, 'pinto/db/name'
    autoload :Password, 'pinto/db/password'
    autoload :User, 'pinto/db/user'
  end

  module Encoding
    autoload :UTF8, 'pinto/encoding/utf8'
  end

  module Error
    autoload :Message, 'pinto/error/message'
  end

  module Helper
    autoload :Translator, 'pinto/helper/translator'
    autoload :URI, 'pinto/helper/uri'

    module HTML
      autoload :Escaper, 'pinto/helper/html/escaper'
    end
  end

  module HTTP
    autoload :Request, 'pinto/http/request'
    autoload :Response, 'pinto/http/response'
    autoload :StatusCode, 'pinto/http/status_code'

    class Response
      autoload :Body, 'pinto/http/response/body'
    end
  end

  class Locale
    autoload :Code, 'pinto/locale/code'
  end

  module Model
    autoload :SignupReservation, 'pinto/model/signup_reservation'
    autoload :User, 'pinto/model/user'
  end

  class OpenID
    autoload :ClaimedID, 'pinto/open_id/claimed_id'
    autoload :UserSuppliedID, 'pinto/open_id/user_supplied_id'
    autoload :Providers, 'pinto/open_id/providers'
    autoload :Provider, 'pinto/open_id/provider'
  end

  module Server
    autoload :Environment, 'pinto/server/environment'
  end

  module Translate
    autoload :MessageID, 'pinto/translate/message_id'
  end

  class URI
    autoload :ExpandProcessor, 'pinto/uri/expand_processor'
    autoload :ExtractProcessor, 'pinto/uri/extract_processor'
    autoload :Parameters, 'pinto/uri/parameters'
    autoload :QueryStrings, 'pinto/uri/query_strings'
    autoload :Template, 'pinto/uri/template'
    autoload :Templates, 'pinto/uri/templates'

    class Templates
      autoload :Record, 'pinto/uri/templates/record'
    end
  end

  class View
    autoload :Context, 'pinto/view/context'
    autoload :Name, 'pinto/view/name'
    autoload :Parameters, 'pinto/view/parameters'
    autoload :XHTML, 'pinto/view/xhtml'
  end
end

autoload :DBI, 'dbi'
autoload :YAML, 'yaml'

require 'rubygems'

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
