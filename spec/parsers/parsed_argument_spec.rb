require '../lib/parsers/parsed_argument'

RSpec.describe ParsedArgument do
  subject(:parsed_argument) { ParsedArgument.new(argument, valid_values) }
  let(:argument) { "*/15"}
  let(:valid_values) { 0..59 }

  describe '#values' do
    it "returns the list of valid times to run" do
      expect(parsed_argument.values).to eql([0, 15, 30, 45])
    end
  end
end
