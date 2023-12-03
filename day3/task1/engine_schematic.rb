require_relative "engine_schema_parser"

class EngineSchematic
  class Number
    attr_reader :value

    def initialize(number)
      @value = number
      @adjacent = false
    end

    def adjacent?
      @adjacent
    end

    def adjacent!
      @adjacent = true
    end
  end

  def initialize(input)
    @input = input
    @numbers = []
    @number_positions = {}
    parse_input
  end

  def adjacent_numbers
    @numbers.select(&:adjacent?).map(&:value)
  end

  private

  def parse_input
    parser = EngineSchemaParser.new(@input)
    parsed_input = parser.parse
    parsed_input[:numbers].each do |number|
      n = Number.new(number[:value])
      @numbers << n
      number[:positions].each do |position|
        @number_positions[position] = n
      end
    end

    adj = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    parsed_input[:symbols].each do |position|
      adj.each do |adjacent_position|
        adjacent = [position[0] + adjacent_position[0], position[1] + adjacent_position[1]]
        next if adjacent[0] < 0 || adjacent[1] < 0
        next if adjacent[0] >= @input.size || adjacent[1] >= @input[adjacent[0]].size

        number = @number_positions[adjacent]
        next if number.nil?
        number.adjacent!
      end
    end
  end
end
