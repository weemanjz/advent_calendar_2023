class Network
  attr_reader :nodes

  def initialize(moves, nodes)
    @moves = moves
    parse_nodes(nodes)
  end

  def navigate
    steps = 0
    steps_to_finish = {}
    current_nodes = nodes.keys.select { |node| node.end_with?("A") }
    # figure out how many steps it takes to get to each Z node
    loop do
      move = @moves[steps % @moves.length]
      steps += 1
      current_nodes = current_nodes.map { |node| nodes[node][move] }
      current_nodes.each.with_index do |node, index|
        next if !node.end_with?("Z") || steps_to_finish[index]
        steps_to_finish[index] = steps
      end
      break if steps_to_finish.size == current_nodes.size
    end
    # calculate the least common multiple of all the steps
    steps_to_finish.values.reduce(1, :lcm)
  end

  private

  def parse_nodes(nodes)
    @nodes = nodes.to_h do |node|
      node, left, right = node.scan(/[A-Z]+/)
      [node, {"L" => left, "R" => right}]
    end
  end
end
