class ParsedArgument
  attr_reader :argument, :valid_values
  private :argument, :valid_values

  def initialize(argument, valid_values)
    @argument = argument
    @valid_values = valid_values
  end

  def values
    if argument.include?('*/')
      increments
    end
  end

  private

  def increments
    step = argument.split('*/').last.to_i
    valid_values.step(step).to_a
  end
end
