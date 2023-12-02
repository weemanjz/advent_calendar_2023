require "rspec"
require_relative "../game"

RSpec.describe Game do
  subject(:game) { described_class.new(input) }

  let(:input) { "Game 11: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red" }

  describe "#cubes_required" do
    it "returns the fewest cubes required" do
      expect(game.cubes_required).to eq("red" => 20, "green" => 13, "blue" => 6)
    end
  end

  describe "#power" do
    it "returns the power of the game" do
      expect(game.power).to eq(1560)
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
        {"blue"=>6, "green"=>8, "red"=>20},
        {"blue"=>5, "green"=>13, "red"=>4},
        {"green"=>5, "red"=>1}
      ])
    end
  end
end
