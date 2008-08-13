module Pinto
  class View
    attr_reader :name, :parameters

    def initialize(name)
      @name = name
      @parameters = {}
    end

    def set_parameter(symbol, value)
      @parameters[symbol] = value
    end

    def render
      template = File.read("view/#{@name}.erb")
      Pinto::View::XHTML.new(template).evaluate(@parameters)
    end
  end
end
