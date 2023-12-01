require "rspec"
require_relative "../calibration_document"

RSpec.describe CalibrationDocument do
  subject(:document) { described_class.new(input) }

  let(:input) do
    [
      "1abc2",
      "pqr3stu8vwx",
      "a1b2c3d4e5f",
      "treb7uchet"
    ]
  end

  describe "#calibration_value" do
    it "sums the calibration values of each line" do
      expect(document.calibration_value).to eq(142)
    end
  end
end
