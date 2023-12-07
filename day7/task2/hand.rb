class Hand
  include Comparable

  attr_reader :card_strengths, :cards, :bid

  CARD_STRENGHTS = {
    "J" => -1, "2" => 0, "3" => 1, "4" => 2, "5" => 3, "6" => 4, "7" => 5, "8" => 6,
    "9" => 7, "T" => 9, "Q" => 10, "K" => 11, "A" => 12
  }

  def initialize(cards, bid)
    @cards = cards
    @card_strengths = cards.chars.map { |card| CARD_STRENGHTS[card] }
    @bid = bid
    @jokers = cards.count("J")
  end

  def strength
    @strength ||= begin
      counts = @card_strengths.tally.values.sort
      case counts
      when [1, 1, 1, 1, 1]
        @jokers == 1 ? 1 : 0 # if one joker, it's a pair
      when [1, 1, 1, 2]
        case @jokers
        when 0 then 1
        when 1, 2 then 3 # if one or two jokers, it's a three of a kind
        end
      when [1, 2, 2]
        case @jokers
        when 0 then 2
        when 1 then 4 # if one joker, it's a full house
        when 2 then 5 # if two jokers, it's a four of a kind
        end
      when [1, 1, 3]
        case @jokers
        when 0 then 3
        when 1, 3 then 5 # if one or three jokers, it's a four of a kind
        end
      when [2, 3]
        case @jokers
        when 0 then 4
        when 2, 3 then 6 # if two or three jokers, it's a five of a kind
        end
      when [1, 4] then 5
        case @jokers
        when 0 then 5
        when 1, 4 then 6 # if one or four jokers, it's a five of a kind
        end
      when [5] then 6
      else 0
      end
    end
  end

  def <=>(other)
    [strength, @card_strengths] <=> [other.strength, other.card_strengths]
  end
end
