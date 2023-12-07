require_relative "hand"

class HandsList
  def initialize(input)
    parse_input(input)
  end

  def total_winnings
    @hands
      .sort
      .each_with_index.sum { |hand, index| hand.bid * (index + 1) }
  end

  private

  def parse_input(input)
    @hands = input.map do |line|
      cards, bid = line.split(" ")
      Hand.new(cards, bid.to_i)
    end
  end
end
