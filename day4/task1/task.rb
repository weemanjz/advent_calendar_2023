require_relative "game"

input = []

while (line = gets)
  input << line.chomp
end

game = Game.new(input)
puts game.points
