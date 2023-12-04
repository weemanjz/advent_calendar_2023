class Card
  def initialize(winning_numbers, numbers)
    @winning_numbers = winning_numbers
    @numbers = numbers
  end

  def points
    no_matching = (@winning_numbers & @numbers).size
    1 << (no_matching - 1)
  end
end
