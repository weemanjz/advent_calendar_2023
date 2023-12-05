require "rspec"
require_relative "../my_range"

RSpec.describe MyRange do
  describe "#&" do
    it "returns nil if ranges don't intersect" do
      expect(MyRange.new(10, 10) & MyRange.new(20, 2)).to be_nil
      expect(MyRange.new(20, 2) & MyRange.new(10, 10)).to be_nil
    end

    it "returns intersection if ranges intersect" do
      expect(MyRange.new(10, 5) & MyRange.new(12, 3)).to eq(MyRange.new(12, 3))
      expect(MyRange.new(10, 5) & MyRange.new(12, 10)).to eq(MyRange.new(12, 3))
      expect(MyRange.new(10, 5) & MyRange.new(8, 10)).to eq(MyRange.new(10, 5))
      expect(MyRange.new(10, 5) & MyRange.new(10, 2)).to eq(MyRange.new(10, 2))
    end
  end

  describe "#-" do
    it "returns self if ranges don't intersect" do
      expect(MyRange.new(10, 10) - MyRange.new(20, 2)).to eq([MyRange.new(10, 10)])
      expect(MyRange.new(20, 2) - MyRange.new(10, 10)).to eq([MyRange.new(20, 2)])
    end

    it "returns difference if ranges intersect" do
      expect(MyRange.new(10, 5) - MyRange.new(12, 3)).to eq([MyRange.new(10, 2)])
      expect(MyRange.new(10, 5) - MyRange.new(12, 10)).to eq([MyRange.new(10, 2)])
      expect(MyRange.new(10, 5) - MyRange.new(8, 10)).to eq([])
      expect(MyRange.new(10, 10) - MyRange.new(10, 4)).to eq([MyRange.new(14, 6)])
      expect(MyRange.new(10, 5) - MyRange.new(12, 2)).to eq([MyRange.new(10, 2), MyRange.new(14, 1)])
    end
  end
end
