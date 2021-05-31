require '../lib/parsers/parsed_minutes'

RSpec.describe ParsedMinutes do
  subject(:parsed_minutes) { ParsedMinutes.new(minutes) }
  let(:minutes) { "*/15" }

  describe '#minutes' do
    it 'returns the list of minutes during the hour to run the job' do
      expect(parsed_minutes.minutes).to eql([0, 15, 30, 45])
    end
  end
end
