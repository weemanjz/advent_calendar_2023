require "rspec"
require_relative "../network"

RSpec.describe Network do
  subject(:network) { described_class.new("LLR", nodes) }

  let(:nodes) do
    [
      "AAA = (BBB, BBB)",
      "BBB = (AAA, ZZZ)",
      "ZZZ = (ZZZ, ZZZ)"
    ]
  end

  describe "#nodes" do
    it "returns parsed nodes" do
      expect(network.nodes).to eq({
        "AAA" => {"L" => "BBB", "R" => "BBB"},
        "BBB" => {"L" => "AAA", "R" => "ZZZ"},
        "ZZZ" => {"L" => "ZZZ", "R" => "ZZZ"}
      })
    end
  end

  describe "#navigate" do
    it "returns number of steps to reach ZZZ from AAA" do
      expect(network.navigate).to eq(6)
    end
  end
end
