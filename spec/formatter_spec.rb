require 'formatter'

RSpec.describe Formatter do
  subject(:formatter) { Formatter.new(arguments) }
  let(:arguments) do
    double(
      ParsedArguments,
      minutes: [0, 15, 30, 45],
      hours: [0],
      days_of_month: [1, 15],
      months: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
      days_of_week: [1, 2, 3, 4, 5],
      command: "/usr/bin/find",
    )
  end

  describe '#format' do
    it 'returns a formatted string to print out to the console' do
      expect(formatter.format).to eql(
        <<~TXT
          minute       0 15 30 45
          hour         0
          day of month 1 15
          month        1 2 3 4 5 6 7 8 9 10 11 12
          day of week  1 2 3 4 5
          command      /usr/bin/find
        TXT
      )
    end
  end
end
