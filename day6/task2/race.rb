class Race
  def initialize(time, distance)
    @time = time
    @distance = distance
  end

  def ways_to_win
    start_time = 0
    while max_distance(start_time) <= @distance
      start_time += 1
    end
    (start_time..(@time - start_time)).size
  end

  def max_distance(holding_time)
    holding_time * (@time - holding_time)
  end
end
