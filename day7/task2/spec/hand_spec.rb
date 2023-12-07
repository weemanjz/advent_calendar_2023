require "rspec"
require_relative "../hand"

RSpec.describe Hand do
  describe "#strength" do
    it "returns 0 when high card" do
      expect(Hand.new("23456", 1).strength).to eq(0)
    end

    it "returns 1 when pair" do
      expect(Hand.new("A23A4", 1).strength).to eq(1)
    end

    it "returns 2 when two pairs" do
      expect(Hand.new("23432", 1).strength).to eq(2)
    end

    it "returns 3 when three of a kind" do
      expect(Hand.new("TTT98", 1).strength).to eq(3)
    end

    it "returns 4 when full house" do
      expect(Hand.new("23332", 1).strength).to eq(4)
    end

    it "returns 5 when four of a kind" do
      expect(Hand.new("AA8AA", 1).strength).to eq(5)
      expect(Hand.new("KTJJT", 1).strength).to eq(5)
    end

    it "returns 6 when five of a kind" do
      expect(Hand.new("AAAAA", 1).strength).to eq(6)
    end
  end

  describe "#card_strengths" do
    it "returns card strengths" do
      expect(Hand.new("23456", 1).card_strengths).to eq([0, 1, 2, 3, 4])
      expect(Hand.new("32T3K", 1).card_strengths).to eq([1, 0, 9, 1, 11])
    end
  end

  describe "#<=>" do
    it "returns -1 when self is stronger" do
      expect(Hand.new("KTJJT", 1)).to be > Hand.new("KK677", 1)
    end

    it "returns 1 when other is stronger" do
      expect(Hand.new("T55J5", 1)).to be < Hand.new("QQQJA", 1)
    end

    it "returns 0 when hands are equal" do
      expect(Hand.new("23455", 1)).to eq(Hand.new("23455", 1))
    end
  end
end
