class ParsedYears
  attr_reader :years_argument
  private :years_argument

  def initialize(years_argument)
    @years_argument = years_argument
  end

  def years
    ParsedArgument.new(years_argument, valid_values).values
  end

  private

  def valid_values
    @valid_values ||= (1970..2099).freeze
  end
end
