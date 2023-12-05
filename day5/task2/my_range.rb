class MyRange
  include Comparable

  attr_reader :start, :size

  def initialize(start, length)
    @start = start
    @size = length
    @range = (start..(start + length - 1))
  end

  def &(other)
    return nil if range.end < other.range.begin || range.begin > other.range.end

    start = [range.begin, other.range.begin].max
    length = [range.end, other.range.end].min - start + 1
    MyRange.new(start, length)
  end

  def -(other)
    intersection = self & other
    return [self] if intersection.nil?

    result = []
    result << MyRange.new(range.begin, intersection.range.begin - range.begin) if range.begin < intersection.range.begin
    result << MyRange.new(intersection.range.end + 1, range.end - intersection.range.end) if range.end > intersection.range.end
    result
  end

  def <=>(other)
    other_range = other.is_a?(MyRange) ? other.range : other
    range.begin <=> other_range.begin && range.end <=> other_range.end
  end

  protected

  attr_reader :range
end
