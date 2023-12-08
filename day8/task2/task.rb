require_relative "network"

moves = gets.chomp
gets

nodes = []
while (line = gets)
  nodes << line.chomp
end

network = Network.new(moves, nodes)
puts network.navigate
