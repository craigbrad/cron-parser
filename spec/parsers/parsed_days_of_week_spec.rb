require '../lib/parsers/parsed_days_of_week'

RSpec.describe ParsedDaysOfWeek do
  subject(:parsed_days) { ParsedDaysOfWeek.new(days) }
  let(:days) { "*" }
  let(:valid_values) { 1..7 }
  let(:parsed_argument) { double(ParsedDaysOfWeek, values: values)}
  let(:values) { [1, 2, 3, 4, 5, 6, 7] }

  before do
    allow(ParsedArgument).to receive(:new).with(days, valid_values).
      and_return(parsed_argument)
  end

  describe '#days' do
    it 'returns the list of hours during the day to run the job' do
      expect(parsed_days.days).to eql(values)
    end
  end
end
