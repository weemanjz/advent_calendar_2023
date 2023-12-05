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
      expect(almanac.seeds).to eq([79, 14, 55, 13])
      expect(almanac.mappings).to eq({
        "seed-to-soil" => [{:destination=>50...52, :source=>98...100}, {:destination=>52...100, :source=>50...98}],
        "soil-to-fertilizer" => [{:destination=>0...37, :source=>15...52}, {:destination=>37...39, :source=>52...54}, {:destination=>39...54, :source=>0...15}],
        "fertilizer-to-water" => [{:destination=>49...57, :source=>53...61}, {:destination=>0...42, :source=>11...53}, {:destination=>42...49, :source=>0...7}, {:destination=>57...61, :source=>7...11}],
        "water-to-light" => [{:destination=>88...95, :source=>18...25}, {:destination=>18...88, :source=>25...95}],
        "light-to-temperature" => [{:destination=>45...68, :source=>77...100}, {:destination=>81...100, :source=>45...64}, {:destination=>68...81, :source=>64...77}],
        "humidity-to-location" => [{:destination=>60...97, :source=>56...93}, {:destination=>56...60, :source=>93...97}],
        "temperature-to-humidity" => [{:destination=>0...1, :source=>69...70}, {:destination=>1...70, :source=>0...69}]
      })
    end
  end

  describe "#seed_to_soil" do
    it "returns correct soil for seed" do
      almanac = Almanac.parse(input)
      expect(almanac.seed_to_soil(79)).to eq(81)
      expect(almanac.seed_to_soil(14)).to eq(14)
      expect(almanac.seed_to_soil(55)).to eq(57)
      expect(almanac.seed_to_soil(13)).to eq(13)
    end
  end

  describe "#seed_to_location" do
    it "returns correct fertilizer for seed" do
      almanac = Almanac.parse(input)
      expect(almanac.seed_to_location(79)).to eq(82)
      expect(almanac.seed_to_location(14)).to eq(43)
      expect(almanac.seed_to_location(55)).to eq(86)
      expect(almanac.seed_to_location(13)).to eq(35)
    end
  end

  describe "lowest_location" do
    it "returns the lowest location" do
      almanac = Almanac.parse(input)
      expect(almanac.lowest_location).to eq(35)
    end
  end
end
