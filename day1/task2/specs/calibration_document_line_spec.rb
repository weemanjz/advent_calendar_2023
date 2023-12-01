require "rspec"
require_relative "../calibration_document"

RSpec.describe CalibrationDocument::Line do
  describe "#calibration_value" do
    it { expect(described_class.new("two1nine").calibration_value).to eq(29) }
    it { expect(described_class.new("eightwothree").calibration_value).to eq(83) }
    it { expect(described_class.new("abcone2threexyz").calibration_value).to eq(13) }
    it { expect(described_class.new("xtwone3four").calibration_value).to eq(24) }
    it { expect(described_class.new("4nineeightseven2").calibration_value).to eq(42) }
    it { expect(described_class.new("zoneight234").calibration_value).to eq(14) }
    it { expect(described_class.new("7pqrstsixteen").calibration_value).to eq(76) }
    it { expect(described_class.new("sevenine").calibration_value).to eq(79) }
    it { expect(described_class.new("eighthree").calibration_value).to eq(83) }
  end
end
