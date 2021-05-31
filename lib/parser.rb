class Parser
  attr_reader :arguments
  private :arguments

  def self.parse(arguments)
    new(arguments).parse
  end

  def initialize(arguments)
    @arguments = arguments
  end

  def parse
    parsed_arguments = ParsedArguments.new(arguments)
    Printer.new(parsed_arguments).print
  end
end



class Printer
  def initialize(arguments)
  end
end
