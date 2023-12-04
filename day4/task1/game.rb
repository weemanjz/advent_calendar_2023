require_relative "card"

class Game
  def initialize(input)
    prepare_cards(input)
  end

  def points
    @cards.map(&:points).sum
  end

  private

  def prepare_cards(input)
    @cards = input.map do |line|
      match = line.match(/^Card\s+\d+: (?<winning>[\d\s]+) \| (?<numbers>[\d\s]+)$/)
      winning = match[:winning].scan(/\d+/).map(&:to_i)
      numbers = match[:numbers].scan(/\d+/).map(&:to_i)
      Card.new(winning, numbers)
    end
  end
end
