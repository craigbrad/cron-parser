require '../lib/parsers/parsed_hours'

RSpec.describe ParsedHours do
  subject(:parsed_hours) { ParsedHours.new(hours) }
  let(:hours) { "*/2" }

  describe '#hours' do
    it 'returns the list of hours during the day to run the job' do
      expect(parsed_hours.hours).to eql(
        [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22]
      )
    end
  end
end
