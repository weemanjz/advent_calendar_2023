require "rspec"
require_relative "../race"

RSpec.describe Race do
  describe "#ways_to_win" do
    it "returns the number of ways to win" do
      expect(described_class.new(7, 9).ways_to_win).to eq(4)
      expect(described_class.new(15, 40).ways_to_win).to eq(8)
      expect(described_class.new(30, 200).ways_to_win).to eq(9)
    end
  end

  describe "#max_distance" do
    subject(:race) { described_class.new(7, 9) }

    it "returns the maximum distance for holding time" do
      expect(race.max_distance(0)).to eq(0)
      expect(race.max_distance(1)).to eq(6)
      expect(race.max_distance(2)).to eq(10)
      expect(race.max_distance(3)).to eq(12)
      expect(race.max_distance(4)).to eq(12)
      expect(race.max_distance(5)).to eq(10)
      expect(race.max_distance(6)).to eq(6)
      expect(race.max_distance(7)).to eq(0)
    end
  end
end
