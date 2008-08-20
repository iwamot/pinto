module Pinto
  def self.version
    return '0.0.1'
  end

  autoload :LocaleSetter, 'pinto/locale_setter'

  autoload :IndexController, 'pinto/controllers/index'
  autoload :MethodNotAllowedController, 'pinto/controllers/method_not_allowed'
  autoload :MultipleChoicesController, 'pinto/controllers/multiple_choices'
  autoload :NotFoundController, 'pinto/controllers/not_found'
  autoload :ServiceUnavailableController, 'pinto/controllers/service_unavailable'
  autoload :UnauthorizedController, 'pinto/controllers/unauthorized'

  autoload :LocaleCodeValidator, 'pinto/validators/locale_code'
  autoload :QueryStringValidator, 'pinto/validators/query_string'
  autoload :UserNameValidator, 'pinto/validators/user_name'
end

$LOAD_PATH << '../pinto_beans/lib'
autoload :PintoBeans, 'pinto_beans'
