require './lib/parsers/parsed_minutes'
require './lib/parsers/parsed_hours'
require './lib/parsers/parsed_days_of_month'
require './lib/parsers/parsed_months'
require './lib/parsers/parsed_days_of_week'

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

  def command
    split_arguments[5]
  end

  private

  def split_arguments
    raise ArgumentError, "Please provide an argument" if arguments.nil?

    @split_arguments ||= arguments.split(' ').tap do |args|
      if args.count != 6
        raise ArgumentError, "Invalid number of arguments"
      end
    end
  end
end
