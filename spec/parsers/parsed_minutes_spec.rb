require './lib/parsers/parsed_minutes'

RSpec.describe ParsedMinutes do
  subject(:parsed_minutes) { ParsedMinutes.new(minutes) }
  let(:minutes) { "*/15" }
  let(:valid_values) { 0..59 }
  let(:parsed_argument) { double(ParsedArgument, values: values)}
  let(:values) { [0, 15, 30, 45] }

  before do
    allow(ParsedArgument).to receive(:new).with(minutes, valid_values).
      and_return(parsed_argument)
  end

  describe '#minutes' do
    it 'returns the list of minutes during the hour to run the job' do
      expect(parsed_minutes.minutes).to eql([0, 15, 30, 45])
    end
  end
end
