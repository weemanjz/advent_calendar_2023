require_relative "engine_schematic"

input = []

while (line = gets)
  input << line.chomp
end

schematic = EngineSchematic.new(input)
puts schematic.adjacent_numbers.sum
