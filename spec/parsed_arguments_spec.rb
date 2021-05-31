require '../lib/parsed_arguments'

RSpec.describe ParsedArguments do
  subject(:parsed_arguments) { ParsedArguments.new(arguments) }
  let(:arguments) { "*/15 */2 1,15 * 1-5 /usr/bin/find" }

  describe "#minutes" do
    it "returns a list of each minute of the hour the job will run" do
      expect(parsed_arguments.minutes).to eql([0, 15, 30, 45])
    end
  end

  describe "#hours" do
    it "returns a list of each hour of the day the job will run" do
      expect(parsed_arguments.hours).to eql(
        [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22]
      )
    end
  end
end
