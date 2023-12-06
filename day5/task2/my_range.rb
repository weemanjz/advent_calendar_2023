class MyRange
  include Comparable

  attr_reader :start, :last, :size

  def initialize(start, length)
    @start = start
    @size = length
    @last = start + length - 1
  end

  def &(other)
    return nil if last < other.start || start > other.last

    start = [@start, other.start].max
    length = [last, other.last].min - start + 1
    MyRange.new(start, length)
  end

  def -(other)
    intersection = self & other
    return [self] if intersection.nil?

    result = []
    result << MyRange.new(start, intersection.start - start) if start < intersection.start
    result << MyRange.new(intersection.last + 1, last - intersection.last) if last > intersection.last
    result
  end

  def <=>(other)
    start <=> other.begin && last <=> other.last
  end

  def begin
    @start
  end

  protected

  attr_reader :range
end
