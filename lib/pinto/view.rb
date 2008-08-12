module Pinto
  class View
    def initialize
      @parameters = Pinto::View::Parameters.new
    end

    def set_parameter(symbol, value)
      unless symbol.is_a? Symbol
        raise TypeError.new('symbol must be Symbol')
      end

      @parameters.set(symbol, value)
    end

    def parameters
      return @parameters
    end

    def name=(name)
      @name = Pinto::View::Name.new(name)
    end

    def name
      return @name
    end

    def render
      template = File.read("view/#{self.name.to_s}.erb")
      return Pinto::HTTP::Response::Body.new(
        Pinto::View::XHTML.new(template).evaluate(self.parameters)
      )
    end
  end
end
