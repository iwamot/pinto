# lib/pinto/view.rb

module Pinto
  class View
    def self.render(name, param = Pinto::Type::ViewParam.new({}))
      unless name.is_a? Pinto::Type::ViewName
        raise ArgumentError.new('name must be Pinto::Type::ViewName')
      end
      unless param.is_a? Pinto::Type::ViewParam
        raise ArgumentError.new('param must be Pinto::Type::ViewParam')
      end

      template = File.read("view/#{name.to_s}.erb")
      return Pinto::View::XHTML.new(template).evaluate(param)
    end
  end
end
