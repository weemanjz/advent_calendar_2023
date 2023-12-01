class CalibrationDocument
  class Line
    def initialize(input)
      @input = input
    end

    def calibration_value
      digits = @input.scan(/\d/)
      (digits[0] + digits[-1]).to_i
    end
  end

  def initialize(input)
    @lines = input.map { |line| Line.new(line) }
  end

  def calibration_value
    @lines.map(&:calibration_value).sum
  end
end
