require_relative "race"

time = gets.scan(/\d/).join.to_i
distance = gets.scan(/\d/).join.to_i

ways_to_win = Race.new(time, distance).ways_to_win
puts ways_to_win
