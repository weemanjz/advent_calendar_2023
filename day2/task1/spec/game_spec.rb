require "rspec"
require_relative "../game"

RSpec.describe Game do
  subject(:game) { described_class.new(input) }

  let(:input) { "Game 11: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green" }

  describe "#possible?" do
    it "returns true if the game is possible" do
      limitations = { "red" => 12, "green" => 13, "blue" => 14 }
      expect(game.possible?(limitations)).to eq(true)
    end

    it "returns false if the game is not possible" do
      limitations = { "red" => 5, "green" => 5, "blue" => 5 }
      expect(game.possible?(limitations)).to eq(false)
    end
  end

  describe "#id" do
    it "returns the game id" do
      expect(game.id).to eq(11)
    end
  end

  describe "#sets" do
    it "returns the sets" do
      expect(game.sets).to eq([
        { "blue" => 3, "red" => 4 },
        { "red" => 1, "green" => 2, "blue" => 6 },
        { "green" => 2 }
      ])
    end
  end
end
