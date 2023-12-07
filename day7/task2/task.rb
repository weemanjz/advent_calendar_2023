require_relative "hands_list"

input = []

while (line = gets)
  input << line.chomp
end

hands = HandsList.new(input)
puts hands.total_winnings
