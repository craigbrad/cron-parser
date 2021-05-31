require '../lib/parsers/parsed_days_of_month'

RSpec.describe ParsedDaysOfMonth do
  subject(:parsed_days) { ParsedDaysOfMonth.new(days) }
  let(:days) { "*/5" }
  let(:valid_values) { 1..31 }
  let(:parsed_argument) { double(ParsedDaysOfMonth, values: values)}
  let(:values) { [5, 10, 15, 20, 25, 30] }

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
