require_relative "games"

LIMITATIONS = {
  "red" => 12,
  "green" => 13,
  "blue" => 14
}

input = []

while (line = gets)
  input << line.chomp
end

games = Games.new(input)
possible = games.possible_games(LIMITATIONS)
puts possible.sum
