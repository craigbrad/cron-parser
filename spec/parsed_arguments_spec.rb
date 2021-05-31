require '../lib/parsed_arguments'

RSpec.describe ParsedArguments do
  subject(:parsed_arguments) { ParsedArguments.new(arguments) }
  let(:arguments) { "*/15 0 1,15 * 1-5 /usr/bin/find" }

  describe "#minutes" do
    it "returns a list of each minute of the hour the job will run" do
      expect(parsed_arguments.minutes).to eql([0, 15, 30, 45])
    end
  end
end
