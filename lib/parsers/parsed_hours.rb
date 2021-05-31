require './lib/parsers/parsed_argument'

class ParsedHours
  attr_reader :hours_argument
  private :hours_argument

  def initialize(hours_argument)
    @hours_argument = hours_argument
  end

  def hours
    ParsedArgument.new(hours_argument, valid_values).values
  end

  private

  def valid_values
    @valid_values ||= (0..23).freeze
  end
end
