require "./lib/parser"

RSpec.describe Parser do
  subject(:parser) { Parser.parse(arguments) }
  let(:arguments) { "*/15 0 1,15 * 1-5 /usr/bin/find" }

  let(:parsed_output) do
    <<~TXT
      minute        0 15 30 45
      hour          0
      day of month  1 15
      month         1 2 3 4 5 6 7 8 9 10 11 12
      day of week   1 2 3 4 5
      command       /usr/bin/find
    TXT
  end

  it "outputs when the cron job will run" do
    expect { parser }.to output(parsed_output).to_stdout
  end

  context 'when invalid input' do
    let(:arguments) { "* * /usr/bin/find" }

    it "raises an appropriate error message" do
      expect { parser }.to output("Invalid number of arguments\n").to_stdout
    end
  end
end
