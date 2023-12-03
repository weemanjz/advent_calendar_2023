require_relative "engine_schematic"

input = []

while (line = gets)
  input << line.chomp
end

schematic = EngineSchematic.new(input)
puts schematic.total_gear_ratios
