require '../lib/parsers/parsed_argument'

RSpec.describe ParsedArgument do
  subject(:parsed_argument) { ParsedArgument.new(argument, valid_values) }
  let(:argument) { '*/15' }
  let(:valid_values) { 0..59 }

  describe '#values' do
    it 'returns the list of valid times to run' do
      expect(parsed_argument.values).to eql([0, 15, 30, 45])
    end

    context 'when passing "*" wildcard' do
      let(:argument) { '*' }
      it 'should return all valid values' do
        expect(parsed_argument.values).to eql(valid_values)
      end
    end

    context 'when passing "-" wildcard' do
      let(:argument) { '1-5' }

      it 'should return the range of valid values' do
        expect(parsed_argument.values).to eql([1, 2, 3, 4, 5])
      end
    end

    context 'when passing "," wildcard' do
      let(:argument) { '1,5,7' }

      it 'should return the range of valid values' do
        expect(parsed_argument.values).to eql([1, 5, 7])
      end
    end

    context 'when single value' do
      let(:argument) { '0' }

      it 'should return the one value' do
        expect(parsed_argument.values).to eql([0])
      end
    end
  end
end
