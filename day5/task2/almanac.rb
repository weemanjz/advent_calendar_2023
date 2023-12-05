require "active_support"
require_relative "my_range"

class Almanac
  attr_reader :seeds, :mappings

  def initialize(seeds, mappings)
    @seeds = seeds
    @mappings = mappings
  end

  def seed_to_soil(seed)
    mapping("seed-to-soil", [seed])
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
    seeds.flat_map do |seed_range|
      seed_to_location(seed_range).map(&:start).min
    end.min
  end

  def self.parse(input)
    seeds = input.shift.scan(/\d+/).map(&:to_i).each_slice(2).map { |a, b| MyRange.new(a, b) }
    mappings = {}
    input.shift
    loop do
      map_name = input.shift.split(" ").first
      mappings[map_name] = []
      while (map = input.shift).present?
        dest, src, len = map.scan(/\d+/).map(&:to_i)
        mappings[map_name] << {
          destination: MyRange.new(dest, len),
          source: MyRange.new(src, len)
        }
      end
      break if input.empty?
    end
    new(seeds, mappings)
  end

  private

  def mapping(name, source)
    result = []
    left = source
    mappings[name].each do |mapping|
      tmp_left = []
      left.each do |left_range|
        if (inter = (mapping[:source] & left_range))
          tmp_left += (left_range - mapping[:source])
          start = inter.start - mapping[:source].start
          result << MyRange.new(mapping[:destination].start + start, inter.size)
          next
        end
        tmp_left << left_range
      end
      left = tmp_left
      break if tmp_left.empty?
    end
    result + left
  end
end
