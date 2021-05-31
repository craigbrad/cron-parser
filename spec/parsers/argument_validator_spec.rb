require '../lib/parsers/argument_validator'

describe ArgumentValidator do
  describe '.validate' do
    subject(:validator) { ArgumentValidator.validate(argument) }
    let(:argument) { '*' }

    it 'returns true if valid' do
      expect(validator).to eql(true)
    end

    context 'when a range of values' do
      let(:argument) { '1-14' }

      it 'returns true' do
        expect(validator).to eql(true)
      end
    end

    context 'when a list of values' do
      let(:argument) { '1,2,3,4,5' }

      it 'returns true' do
        expect(validator).to eql(true)
      end
    end

    context 'when an increment' do
      let(:argument) { '*/5' }

      it 'returns true' do
        expect(validator).to eql(true)
      end
    end

    context 'when an invalid input' do
      let(:argument) { 'invalid' }

      it 'returns true' do
        expect { validator }.to raise_error(
          ArgumentError,
          "Invalid character found in argument"
        )
      end
    end
  end
end
