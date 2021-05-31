class Formatter
  attr_reader :parsed_arguments
  private :parsed_arguments

  def initialize(parsed_arguments)
    @parsed_arguments = parsed_arguments
  end

  def format
    <<~TXT
      minute       #{ parsed_arguments.minutes.join(' ') }
      hour         #{ parsed_arguments.hours.join(' ') }
      day of month #{ parsed_arguments.days_of_month.join(' ') }
      month        #{ parsed_arguments.months.join(' ') }
      day of week  #{ parsed_arguments.days_of_week.join(' ') }
      command      #{ parsed_arguments.command }
    TXT
  end
end
