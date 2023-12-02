class Game
  attr_reader :id, :sets

  def initialize(input)
    @input = input
    @sets = []
    parse_input
  end

  def power
    cubes_required.values.inject(:*)
  end

  def cubes_required
    sets.each_with_object({}) do |set, result|
      set.each do |color, count|
        result[color] = count if count > (result[color] || 0)
      end
    end
  end

  private

  def parse_input
    match = @input.match(/^Game (?<id>\d+): (?<sets>.*)/)
    @id = match["id"].to_i
    @sets = match["sets"].split(";").map do |set|
      parse_set(set)
    end
  end

  def parse_set(set)
    set.strip.split(",").to_h do |item|
      color, count = item.split(" ").reverse
      [color, count.to_i]
    end
  end
end
