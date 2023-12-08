class Network
  attr_reader :nodes

  def initialize(moves, nodes)
    @moves = moves
    parse_nodes(nodes)
  end

  def navigate
    steps = 0
    current_node = "AAA"
    loop do
      move = @moves[steps % @moves.length]
      steps += 1
      current_node = nodes[current_node][move]
      break if current_node == "ZZZ"
    end
    steps
  end

  private

  def parse_nodes(nodes)
    @nodes = nodes.to_h do |node|
      node, left, right = node.scan(/[A-Z]+/)
      [node, {"L" => left, "R" => right}]
    end
  end
end
