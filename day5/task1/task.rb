require_relative "almanac"

input = []

while (line = gets)
  input << line.chomp
end

game = Almanac.parse(input)
puts game.lowest_location
