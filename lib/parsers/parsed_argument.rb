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
    elsif argument == '*'
      valid_values.to_a
    elsif argument.include?('-')
      range
    elsif argument.include?(',')
      item_list
    else
      single_value
    end
  end

  private

  def increments
    step = argument.split('*/').last.to_i
    valid_values.step(step).to_a
  end

  def range
    range = argument.split('-')
    start = range.first.to_i
    finish = range.last.to_i
    (start..finish).to_a & valid_values.to_a
  end

  def item_list
    items = argument.split(',').map(&:to_i)
    items & valid_values.to_a
  end

  def single_value
    Array(argument.to_i) & valid_values.to_a
  end
end
