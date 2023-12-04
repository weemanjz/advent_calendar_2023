class Card
  attr_reader :id

  def initialize(id, winning_numbers, numbers)
    @id = id
    @winning_numbers = winning_numbers
    @numbers = numbers
  end

  def matching_numbers
    @winning_numbers & @numbers
  end
end
