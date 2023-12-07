require "rspec"
require_relative "../hands_list"

RSpec.describe HandsList do
  subject(:hands_list) { described_class.new(input) }

  let(:input) do
    [
      "32T3K 765",
      "T55J5 684",
      "KK677 28",
      "KTJJT 220",
      "QQQJA 483"
    ]
  end

  describe "#total_winnings" do
    it "returns total winnings" do
      expect(hands_list.total_winnings).to eq(5905)
    end
  end
end
