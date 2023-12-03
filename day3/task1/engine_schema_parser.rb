class EngineSchemaParser
  def initialize(schema)
    @schema = schema
    @numbers = []
    @symbols = []
  end

  def parse
    @schema.each_with_index do |row, row_index|
      numbers = row.scan(/\d+/)
      start_pos = row.gsub(/\d+/).map { Regexp.last_match.begin(0) }
      numbers.zip(start_pos).each do |number, start_pos|
        @numbers << {
          value: number.to_i,
          positions: (start_pos...(start_pos + number.length)).map { |col_index| [row_index, col_index] }
        }
      end

      symbol_positions = row.gsub(/[^0-9\.]/).map { Regexp.last_match.begin(0) }
      @symbols += symbol_positions.map { |position| [row_index, position] }
    end

    {
      symbols: @symbols,
      numbers: @numbers
    }
  end
end
