class ParsedArguments
  attr_reader :arguments
  private :arguments

  def initialize(arguments)
    @arguments = arguments
  end

  def minutes
    valid_values = 0..59
    minute_argument = split_arguments[0]
    if minute_argument.include?('*/')
      step = minute_argument.split('*/').last.to_i
      valid_values.step(step).to_a
    end
  end

  def hours
    valid_values = 0..23
    hour_argument = split_arguments[1]
    if hour_argument.include?('*/')
      step = hour_argument.split('*/').last.to_i
      valid_values.step(step).to_a
    end

  end

  private

  def split_arguments
    @split_arguments ||= arguments.split(' ')
  end
end
