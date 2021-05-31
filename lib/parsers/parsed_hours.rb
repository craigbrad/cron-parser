class ParsedHours
  attr_reader :hours_argument
  private :hours_argument

  def initialize(hours_argument)
    @hours_argument = hours_argument
  end

  def hours
    if hours_argument.include?('*/')
      step = hours_argument.split('*/').last.to_i
      valid_values.step(step).to_a
    end
  end

  private

  def valid_values
    @valid_values ||= (0..23).freeze
  end
end
