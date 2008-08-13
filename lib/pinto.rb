require 'pathname'
require 'pinto/core_ext/class'
require 'pinto/core_ext/string'

module Pinto
  def self.version
    return '0.0.1'
  end

  autoload :Config, 'pinto/config'
  autoload :Dispatcher, 'pinto/dispatcher'
  autoload :Locale, 'pinto/locale'
  autoload :Translator, 'pinto/translator'
  autoload :URI, 'pinto/uri'
  autoload :View, 'pinto/view'

  class Config
    autoload :DB, 'pinto/config/db'
  end

  module Controller
    autoload :Base, 'pinto/controller/base'
    autoload :Error, 'pinto/controller/error'
    autoload :Index, 'pinto/controller/index'
    autoload :Multiple, 'pinto/controller/multiple'
    autoload :SignupAccount, 'pinto/controller/signup_account'
    autoload :SignupAuth, 'pinto/controller/signup_auth'
    autoload :SignupOpenid, 'pinto/controller/signup_openid'
    autoload :User, 'pinto/controller/user'
    autoload :Users, 'pinto/controller/users'
  end

  module Helper
    autoload :Translator, 'pinto/helper/translator'
    autoload :URI, 'pinto/helper/uri'

    module HTML
      autoload :Escaper, 'pinto/helper/html/escaper'
    end
  end

  module HTTP
    autoload :ContentType, 'pinto/http/content_type'
    autoload :Request, 'pinto/http/request'
    autoload :Response, 'pinto/http/response'
    autoload :StatusCode, 'pinto/http/status_code'
  end

  module Model
    autoload :SignupReservation, 'pinto/model/signup_reservation'
    autoload :User, 'pinto/model/user'
  end

  module OpenID
    autoload :Consumer, 'pinto/open_id/consumer'
  end

  module URI
    autoload :ExpandProcessor, 'pinto/uri/expand_processor'
    autoload :ExtractProcessor, 'pinto/uri/extract_processor'
  end

  class User
    autoload :Name, 'pinto/user/name'
  end

  class View
    autoload :Context, 'pinto/view/context'
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
