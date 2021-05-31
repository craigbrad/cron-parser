require './lib/parsed_arguments'

RSpec.describe ParsedArguments do
  subject(:parsed_arguments) { ParsedArguments.new(arguments) }
  let(:arguments) { "*/15 */2 1,15 * 1-5 /usr/bin/find" }

  describe "#minutes" do
    let(:parsed_minutes) { double(ParsedMinutes, minutes: minutes) }
    let(:minutes) { [0, 15, 30, 45] }

    before do
      allow(ParsedMinutes).to receive(:new).with('*/15').
        and_return(parsed_minutes)
    end

    it "returns a list of each minute of the hour the job will run" do
      expect(parsed_arguments.minutes).to eql(minutes)
    end
  end

  describe "#hours" do
    let(:parsed_hours) { double(ParsedHours, hours: hours) }
    let(:hours) { [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22] }

    before do
      allow(ParsedHours).to receive(:new).with('*/2').
        and_return(parsed_hours)
    end

    it "returns a list of each minute of the hour the job will run" do
      expect(parsed_arguments.hours).to eql(hours)
    end
  end

  describe "#days_of_month" do
    let(:parsed_days) { double(ParsedDaysOfMonth, days: days) }
    let(:days) { [1, 15] }

    before do
      allow(ParsedDaysOfMonth).to receive(:new).with('1,15').
        and_return(parsed_days)
    end

    it "returns a list of each minute of the hour the job will run" do
      expect(parsed_arguments.days_of_month).to eql(days)
    end
  end

  describe "#months" do
    let(:parsed_months) { double(ParsedMonths, months: months) }
    let(:months) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] }

    before do
      allow(ParsedMonths).to receive(:new).with('*').
        and_return(parsed_months)
    end

    it "returns a list of each minute of the hour the job will run" do
      expect(parsed_arguments.months).to eql(months)
    end
  end

  describe "#days_of_week" do
    let(:parsed_days) { double(ParsedDaysOfWeek, days: days) }
    let(:days) { [1, 2, 3, 4, 5] }

    before do
      allow(ParsedDaysOfWeek).to receive(:new).with('1-5').
        and_return(parsed_days)
    end

    it "returns a list of each minute of the hour the job will run" do
      expect(parsed_arguments.days_of_week).to eql(days)
    end
  end

  context "when invalid number of arguments" do
    let(:arguments) { "*/15 */2 1,15 /usr/bin/find" }

    it "raises a relevant error" do
      expect { parsed_arguments.months }.to raise_error(
        ArgumentError, "Invalid number of arguments"
      )
    end
  end

  context "when no arguments" do
    let(:arguments) { }

    it "raises a relevant error" do
      expect { parsed_arguments.months }.to raise_error(
        ArgumentError, "Please provide an argument"
      )
    end
  end
end
