class ParsedMinutes
  attr_reader :minutes_argument
  private :minutes_argument

  def initialize(minutes_argument)
    @minutes_argument = minutes_argument
  end

  def minutes
    if minutes_argument.include?('*/')
      step = minutes_argument.split('*/').last.to_i
      valid_values.step(step).to_a
    end
  end

  private

  def valid_values
    @valid_values ||= (0..59).freeze
  end
end
