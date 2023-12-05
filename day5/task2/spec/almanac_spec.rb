require "rspec"
require_relative "../almanac"

RSpec.describe Almanac do
  let(:input) do
    [
      "seeds: 79 14 55 13",
      "",
      "seed-to-soil map:",
      "50 98 2",
      "52 50 48",
      "",
      "soil-to-fertilizer map:",
      "0 15 37",
      "37 52 2",
      "39 0 15",
      "",
      "fertilizer-to-water map:",
      "49 53 8",
      "0 11 42",
      "42 0 7",
      "57 7 4",
      "",
      "water-to-light map:",
      "88 18 7",
      "18 25 70",
      "",
      "light-to-temperature map:",
      "45 77 23",
      "81 45 19",
      "68 64 13",
      "",
      "temperature-to-humidity map:",
      "0 69 1",
      "1 0 69",
      "",
      "humidity-to-location map:",
      "60 56 37",
      "56 93 4",
    ]
  end

  describe ".parse" do
    it "returns an Almanac instance" do
      almanac = Almanac.parse(input)
      expect(almanac.seeds).to eq([(79..92), (55..67)])
      expect(almanac.mappings).to eq({
        "fertilizer-to-water" => [{:destination=>49..56, :source=>53..60}, {:destination=>0..41, :source=>11..52}, {:destination=>42..48, :source=>0..6}, {:destination=>57..60, :source=>7..10}],
        "humidity-to-location" => [{:destination=>60..96, :source=>56..92}, {:destination=>56..59, :source=>93..96}],
        "light-to-temperature" => [{:destination=>45..67, :source=>77..99}, {:destination=>81..99, :source=>45..63}, {:destination=>68..80, :source=>64..76}],
        "seed-to-soil" => [{:destination=>50..51, :source=>98..99}, {:destination=>52..99, :source=>50..97}],
        "soil-to-fertilizer" => [{:destination=>0..36, :source=>15..51}, {:destination=>37..38, :source=>52..53}, {:destination=>39..53, :source=>0..14}],
        "temperature-to-humidity" => [{:destination=>0..0, :source=>69..69}, {:destination=>1..69, :source=>0..68}],
        "water-to-light" => [{:destination=>88..94, :source=>18..24}, {:destination=>18..87, :source=>25..94}]
      })
    end
  end

  describe "#seed_to_soil" do
    it "returns correct soil for seed" do
      almanac = Almanac.parse(input)
      expect(almanac.seed_to_soil(MyRange.new(79, 14))).to eq([MyRange.new(81, 14)])
      expect(almanac.seed_to_soil(MyRange.new(55, 13))).to eq([MyRange.new(57, 13)])
    end
  end

  describe "#seed_to_location" do
    it "returns correct fertilizer for seed" do
      almanac = Almanac.parse(input)
      expect(almanac.seed_to_location(MyRange.new(79, 14))).to eq([MyRange.new(60, 1), MyRange.new(82, 3), MyRange.new(46, 10)])
      expect(almanac.seed_to_location(MyRange.new(55, 13))).to eq([MyRange.new(86, 4), MyRange.new(94, 3), MyRange.new(56, 4), MyRange.new(97, 2)])
    end
  end

  describe "lowest_location" do
    it "returns the lowest location" do
      almanac = Almanac.parse(input)
      expect(almanac.lowest_location).to eq(46)
    end
  end
end
