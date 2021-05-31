require './lib/parsers/parsed_months'

RSpec.describe ParsedMonths do
  subject(:parsed_months) { ParsedMonths.new(months) }
  let(:months) { "1-6" }
  let(:valid_values) { 1..12 }
  let(:parsed_argument) { double(ParsedArgument, values: values)}
  let(:values) { [1, 2, 3, 4, 5, 6] }

  before do
    allow(ParsedArgument).to receive(:new).with(months, valid_values).
      and_return(parsed_argument)
  end

  describe '#minutes' do
    it 'returns the list of minutes during the hour to run the job' do
      expect(parsed_months.months).to eql(values)
    end
  end
end
