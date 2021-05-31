require './lib/parsers/parsed_argument'

class ParsedMonths
  attr_reader :months_argument
  private :months_argument

  def initialize(months_argument)
    @months_argument = months_argument
  end

  def months
    ParsedArgument.new(months_argument, valid_values).values
  end

  private

  def valid_values
    @valid_values ||= (1..12).freeze
  end
end
