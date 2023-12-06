class Race
  def initialize(time, distance)
    @time = time
    @distance = distance
  end

  def ways_to_win
    (0..@time).count { |holding_time| max_distance(holding_time) > @distance }
  end

  def max_distance(holding_time)
    holding_time * (@time - holding_time)
  end
end
