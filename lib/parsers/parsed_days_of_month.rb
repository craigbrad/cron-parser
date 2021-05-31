class ParsedDaysOfMonth
  attr_reader :days_argument
  private :days_argument

  def initialize(days_argument)
    @days_argument = days_argument
  end

  def days
    ParsedArgument.new(days_argument, valid_values).values
  end

  private

  def valid_values
    @valid_values ||= (1..31).freeze
  end
end
