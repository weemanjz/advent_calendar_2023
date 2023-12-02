require_relative "game"

class Games
  def initialize(input)
    @games = input.map { |line| Game.new(line) }
  end

  def possible_games(limitations)
    games = @games.select { |game| game.possible?(limitations) }
    games.map(&:id)
  end
end
