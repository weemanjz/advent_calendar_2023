require "rspec"
require_relative "../card"

RSpec.describe Card do
  subject(:card) { described_class.new(1, winning_numbers, numbers) }

  describe "#matching_numbers" do
    context "when multiple matching numbers" do
      let(:winning_numbers) { [41, 48, 83, 86, 17] }
      let(:numbers) { [83, 86, 6, 31, 17, 9, 48, 53] }

      it { expect(card.matching_numbers).to eq([48, 83, 86, 17]) }
    end

    context "when one matching numbers" do
      let(:winning_numbers) { [41, 92, 73, 84, 69] }
      let(:numbers) { [59, 84, 76, 51, 58, 5, 54, 83] }

      it { expect(card.matching_numbers).to eq([84]) }
    end

    context "when no matching numbers" do
      let(:winning_numbers) { [87, 83, 26, 28, 32] }
      let(:numbers) { [88, 30, 70, 12, 93, 22, 82, 36] }

      it { expect(card.matching_numbers).to eq([]) }
    end
  end
end
