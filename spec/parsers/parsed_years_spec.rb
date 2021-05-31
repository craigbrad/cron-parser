require '../lib/parsers/parsed_years'

RSpec.describe ParsedYears do
  subject(:parsed_years) { ParsedYears.new(years) }
  let(:years) { "2021,2022" }
  let(:valid_values) { 1970..2099 }
  let(:parsed_argument) { double(ParsedArgument, values: values)}
  let(:values) { [2021, 2022] }

  before do
    allow(ParsedArgument).to receive(:new).with(years, valid_values).
      and_return(parsed_argument)
  end

  describe '#minutes' do
    it 'returns the list of minutes during the hour to run the job' do
      expect(parsed_years.years).to eql(values)
    end
  end
end
