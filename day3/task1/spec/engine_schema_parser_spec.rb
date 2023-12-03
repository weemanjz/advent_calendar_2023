require "rspec"
require_relative "../engine_schema_parser"

RSpec.describe EngineSchemaParser do
  subject(:parser) { described_class.new(input) }

  let(:input) do
    [
      "467..114..",
      "/..*......",
      "..35..633.",
      "......#..."
    ]
  end

  describe "#parse" do
    it "returns list of positions of numbers and symbols" do
      expect(parser.parse).to eq({
        symbols: [[1, 0], [1, 3], [3, 6]],
        numbers: [
          { value: 467, positions: [[0, 0], [0, 1], [0, 2]] },
          { value: 114, positions: [[0, 5], [0, 6], [0, 7]] },
          { value: 35, positions: [[2, 2], [2, 3]] },
          { value: 633, positions: [[2, 6], [2, 7], [2, 8]]}
        ]
      })
    end
  end
end
