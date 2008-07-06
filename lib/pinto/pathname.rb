# lib/pinto/pathname.rb

require 'pathname'
require 'pinto/string'

class Pathname
  def get_class
    self.to_classname.split('::').inject(Object) do |parent, child|
       parent.const_get(child)
    end
  end

  def to_classname
    self.to_str.split('/').map {|part| part.camelize}.join('::')
  end
end
