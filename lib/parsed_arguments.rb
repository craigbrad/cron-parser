class ParsedArguments
  attr_reader :arguments
  private :arguments

  def initialize(arguments)
    @arguments = arguments
  end

  def minutes
    ParsedMinutes.new(split_arguments[0]).minutes
  end

  def hours
    ParsedHours.new(split_arguments[1]).hours
  end

  def days_of_month
    ParsedDaysOfMonth.new(split_arguments[2]).days
  end

  def months
    ParsedMonths.new(split_arguments[3]).months
  end

  def days_of_week
    ParsedDaysOfWeek.new(split_arguments[4]).days
  end

  private

  def split_arguments
    @split_arguments ||= arguments.split(' ')
  end
end
