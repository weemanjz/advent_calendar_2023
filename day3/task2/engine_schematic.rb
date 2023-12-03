require "pry"
require_relative "engine_schema_parser"

class EngineSchematic
  class Number
    attr_reader :value, :id

    def initialize(number, id)
      @value = number
      @id = id
    end
  end

  def initialize(input)
    @input = input
    @numbers = {}

    parse_input
  end

  def total_gear_ratios
    gear_ratios.sum
  end

  def gear_ratios
    ratios = []
    adj = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    @symbols.each do |position|
      adjacent_numbers = []
      adj.each do |adjacent_position|
        adjacent = [position[0] + adjacent_position[0], position[1] + adjacent_position[1]]
        next if adjacent[0] < 0 || adjacent[1] < 0
        next if adjacent[0] >= @input.size || adjacent[1] >= @input[adjacent[0]].size

        number = @numbers[adjacent]
        next if number.nil?
        adjacent_numbers << number
      end
      adjacent_numbers.uniq!(&:id)
      next if adjacent_numbers.size != 2

      ratios << adjacent_numbers[0].value * adjacent_numbers[1].value
    end
    ratios
  end

  private

  def parse_input
    parser = EngineSchemaParser.new(@input)
    parsed_input = parser.parse
    parsed_input[:numbers].each_with_index do |number, i|
      n = Number.new(number[:value], i)
      number[:positions].each do |position|
        @numbers[position] = n
      end
    end
    @symbols = parsed_input[:symbols]
  end
end
