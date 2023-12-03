require "rspec"
require_relative "../engine_schematic"

RSpec.describe EngineSchematic do
  subject(:engine_schematic) { described_class.new(input) }

  let(:input) do
    [
      "467..114..",
      "...*......",
      "..35..633.",
      "......#...",
      "617*......",
      ".....+.58.",
      "..592.....",
      "......755.",
      "...$.*....",
      ".664.598.."
    ]
  end

  describe "#total_gear_ratios" do
    it "returns the total gear ratio" do
      expect(engine_schematic.total_gear_ratios).to eq(467835)
    end
  end
end
