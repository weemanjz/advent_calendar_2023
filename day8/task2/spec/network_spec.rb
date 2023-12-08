require "rspec"
require_relative "../network"

RSpec.describe Network do
  subject(:network) { described_class.new("LR", nodes) }

  let(:nodes) do
    [
      "FFA = (FFB, XXX)",
      "FFB = (XXX, FFZ)",
      "FFZ = (FFB, XXX)",
      "KKA = (KKB, XXX)",
      "KKB = (KKC, KKC)",
      "KKC = (KKZ, KKZ)",
      "KKZ = (KKB, KKB)",
      "XXX = (XXX, XXX)"
    ]
  end

  describe "#nodes" do
    it "returns parsed nodes" do
      expect(network.nodes).to eq({
        "FFA" => {"L"=>"FFB", "R"=>"XXX"},
        "FFB" => {"L"=>"XXX", "R"=>"FFZ"},
        "FFZ" => {"L"=>"FFB", "R"=>"XXX"},
        "KKA" => {"L"=>"KKB", "R"=>"XXX"},
        "KKB" => {"L"=>"KKC", "R"=>"KKC"},
        "KKC" => {"L"=>"KKZ", "R"=>"KKZ"},
        "KKZ" => {"L"=>"KKB", "R"=>"KKB"},
        "XXX" => {"L"=>"XXX", "R"=>"XXX"}
      })
    end
  end

  describe "#navigate" do
    it "returns number of steps to reach all ..Z from all ..A" do
      expect(network.navigate).to eq(6)
    end
  end
end
