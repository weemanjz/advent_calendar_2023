require "rspec"
require_relative "../calibration_document"

RSpec.describe CalibrationDocument::Line do
  describe "#calibration_value" do
    it { expect(described_class.new("1abc2").calibration_value).to eq(12) }
    it { expect(described_class.new("pqr3stu8vwx").calibration_value).to eq(38) }
    it { expect(described_class.new("a1b2c3d4e5f").calibration_value).to eq(15) }
    it { expect(described_class.new("treb7uchet").calibration_value).to eq(77) }
  end
end
