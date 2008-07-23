# lib/pinto/view.rb

module Pinto
  class View
    def self.render(view, param = {})
      template = File.read("view/#{view}.erb")
      return Pinto::View::XHTML.new(template).evaluate(param)
    end
  end
end
