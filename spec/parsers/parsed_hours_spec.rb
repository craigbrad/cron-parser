require './lib/parsers/parsed_hours'

RSpec.describe ParsedHours do
  subject(:parsed_hours) { ParsedHours.new(hours) }
  let(:hours) { "*/2" }
  let(:valid_values) { 0..23 }
  let(:parsed_argument) { double(ParsedArgument, values: values)}
  let(:values) { [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22] }

  before do
    allow(ParsedArgument).to receive(:new).with(hours, valid_values).
      and_return(parsed_argument)
  end

  describe '#hours' do
    it 'returns the list of hours during the day to run the job' do
      expect(parsed_hours.hours).to eql(values)
    end
  end
end
