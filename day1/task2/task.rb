require_relative "calibration_document"

input = []

while (line = gets)
  input << line.chomp
end

calibration_document = CalibrationDocument.new(input)
puts calibration_document.calibration_value
