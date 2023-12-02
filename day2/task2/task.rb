require_relative "games"

input = []

while (line = gets)
  input << line.chomp
end

games = Games.new(input)
puts games.total_power
