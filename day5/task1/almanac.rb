require "active_support"

class Almanac
  attr_reader :seeds, :mappings

  def initialize(seeds, mappings)
    @seeds = seeds
    @mappings = mappings
  end

  def seed_to_soil(seed)
    mapping("seed-to-soil", seed)
  end

  def seed_to_fertilizer(seed)
    soil = seed_to_soil(seed)
    mapping("soil-to-fertilizer", soil)
  end

  def seed_to_water(seed)
    fertilizer = seed_to_fertilizer(seed)
    mapping("fertilizer-to-water", fertilizer)
  end

  def seed_to_light(seed)
    water = seed_to_water(seed)
    mapping("water-to-light", water)
  end

  def seed_to_temperature(seed)
    light = seed_to_light(seed)
    mapping("light-to-temperature", light)
  end

  def seed_to_humidity(seed)
    temperature = seed_to_temperature(seed)
    mapping("temperature-to-humidity", temperature)
  end

  def seed_to_location(seed)
    humidity = seed_to_humidity(seed)
    mapping("humidity-to-location", humidity)
  end

  def lowest_location
    seeds.map { |seed| seed_to_location(seed) }.min
  end

  def self.parse(input)
    seeds = input.shift.scan(/\d+/).map(&:to_i)
    mappings = {}
    input.shift
    loop do
      map_name = input.shift.split(" ").first
      mappings[map_name] = []
      while (map = input.shift).present?
        dest, src, len = map.scan(/\d+/).map(&:to_i)
        mappings[map_name] << {
          destination: (dest...(dest + len)),
          source: (src...(src + len))
        }
      end
      break if input.empty?
    end
    new(seeds, mappings)
  end

  private

  def mapping(name, source)
    map = mappings[name].find do |mapping|
      mapping[:source].include?(source)
    end
    return source if map.nil?

    diff = source - map[:source].begin
    map[:destination].begin + diff
  end
end
