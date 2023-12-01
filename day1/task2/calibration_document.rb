require "pry"

class CalibrationDocument
  class Line
    DIGIT_MAPINGS = {
      "one" => "1",
      "two" => "2",
      "three" => "3",
      "four" => "4",
      "five" => "5",
      "six" => "6",
      "seven" => "7",
      "eight" => "8",
      "nine" => "9"
    }

    def initialize(input)
      @input = input
    end

    def calibration_value
      (first_digit + last_digit).to_i
    end

    private

    def first_digit
      regex = Regexp.union(DIGIT_MAPINGS.keys + [/\d/])
      @input
        .scan(regex)
        .map { |digit| DIGIT_MAPINGS.fetch(digit, digit) }
        .first
    end

    def last_digit
      # words can overlap so we have to reverse the input and the regex
      regex = Regexp.union(DIGIT_MAPINGS.keys.map(&:reverse) + [/\d/])
      @input
        .reverse
        .scan(regex)
        .map(&:reverse)
        .map { |digit| DIGIT_MAPINGS.fetch(digit, digit) }
        .first
    end
  end

  def initialize(input)
    @lines = input.map { |line| Line.new(line) }
  end

  def calibration_values
    @lines.map(&:calibration_value)
  end

  def calibration_value
    calibration_values.sum
  end
end
