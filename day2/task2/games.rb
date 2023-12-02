require_relative "game"

class Games
  def initialize(input)
    @games = input.map { |line| Game.new(line) }
  end

  def total_power
    @games.map(&:power).sum
  end
end
