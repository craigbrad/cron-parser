class ParsedMinutes
  attr_reader :minutes_argument
  private :minutes_argument

  def initialize(minutes_argument)
    @minutes_argument = minutes_argument
  end

  def minutes
    ParsedArgument.new(minutes_argument, valid_values).values
  end

  private

  def valid_values
    @valid_values ||= (0..59).freeze
  end
end
