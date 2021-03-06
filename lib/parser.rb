require './lib/parsed_arguments'
require './lib/formatter'

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
    puts Formatter.new(parsed_arguments).format
  rescue ArgumentError => e
    puts e
  end
end
