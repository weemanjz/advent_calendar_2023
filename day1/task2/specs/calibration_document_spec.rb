require "rspec"
require_relative "../calibration_document"

RSpec.describe CalibrationDocument do
  subject(:document) { described_class.new(input) }

  let(:input) do
    [
      "two1nine",
      "eightwothree",
      "abcone2threexyz",
      "xtwone3four",
      "4nineeightseven2",
      "zoneight234",
      "7pqrstsixteen"
    ]
  end

  describe "#calibration_value" do
    it "sums the calibration values of each line" do
      expect(document.calibration_value).to eq(281)
    end
  end
end
