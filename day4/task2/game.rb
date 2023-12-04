require_relative "card"

class Game
  def initialize(input)
    @cards = {}
    prepare_cards(input)
  end

  def number_of_cards
    size = 0
    @cards.each do |id, card|
      size += card[:count]
      winning_numbers = card[:card].matching_numbers.size
      next if winning_numbers == 0

      (1..winning_numbers).each do |i|
        break if @cards[id + i].nil?

        @cards[id + i][:count] += card[:count]
      end
    end
    size
  end

  private

  def prepare_cards(input)
    input.each do |line|
      match = line.match(/^Card\s+(?<id>\d+): (?<winning>[\d\s]+) \| (?<numbers>[\d\s]+)$/)
      id = match[:id].to_i
      winning = match[:winning].scan(/\d+/).map(&:to_i)
      numbers = match[:numbers].scan(/\d+/).map(&:to_i)
      @cards[id] = { card: Card.new(id, winning, numbers), count: 1 }
    end
  end
end
