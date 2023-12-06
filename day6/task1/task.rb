require_relative "race"

times = gets.scan(/\d+/).map(&:to_i)
distances = gets.scan(/\d+/).map(&:to_i)

res = times.zip(distances).inject(1) do |result, (time, distance)|
  ways_to_win = Race.new(time, distance).ways_to_win
  result * ways_to_win
end
puts res
