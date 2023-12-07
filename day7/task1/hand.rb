class Hand
  include Comparable

  attr_reader :card_strengths, :cards, :bid

  CARD_STRENGHTS = {
    "2" => 0, "3" => 1, "4" => 2, "5" => 3, "6" => 4, "7" => 5, "8" => 6,
    "9" => 7, "T" => 9, "J" => 10, "Q" => 11, "K" => 12, "A" => 13
  }

  def initialize(cards, bid)
    @cards = cards
    @card_strengths = cards.chars.map { |card| CARD_STRENGHTS[card] }
    @bid = bid
  end

  def strength
    @strength ||= begin
      counts = @card_strengths.tally.values.sort
      case counts
      when [1, 1, 1, 2] then 1
      when [1, 2, 2] then 2
      when [1, 1, 3] then 3
      when [2, 3] then 4
      when [1, 4] then 5
      when [5] then 6
      else 0
      end
    end
  end

  def <=>(other)
    [strength, @card_strengths] <=> [other.strength, other.card_strengths]
  end
end
