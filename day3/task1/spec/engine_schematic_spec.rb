require "rspec"
require_relative "../engine_schematic"

RSpec.describe EngineSchematic do
  subject(:engine_schematic) { described_class.new(input) }

  let(:input) do
    [
      "467..114..",
      "/..*......",
      "..35..633.",
      "......#..."
    ]
  end

  describe "#adjacent_numbers" do
    it "returns the adjacent numbers to symbols" do
      expect(engine_schematic.adjacent_numbers).to eq([467, 35, 633])
    end
  end
end
