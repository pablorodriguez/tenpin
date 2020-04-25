require 'spec_helper'

RSpec.describe Frame do

  context "invalid" do
    it "/|/" do
      frame = Frame.new("/|/")
      expect(frame.points).to be(0)
    end

    it "X|X" do
      frame = Frame.new("/|/")
      expect(frame.points).to be(0)
    end

    it "//" do
      frame = Frame.new("//")
      expect(frame.points).to be(0)
    end

    it "X/" do
      frame = Frame.new("X/")
      expect(frame.points).to be(0)
    end

    it "/X" do
      frame = Frame.new("/X")
      expect(frame.points).to be(0)
    end

    it "XX" do
      frame = Frame.new("XX")
      expect(frame.points).to be(0)
    end

    it "23" do
      frame = Frame.new("23")
      expect(frame.points).to be(0)
    end

    it "//X" do
      frame = Frame.new("//X")
      expect(frame.points).to be(0)
    end


  end

  context "spares" do

    it "8|/" do
      frame = Frame.new("8|/")
      expect(frame.is_spare?).to be_truthy
    end

    it "2|/" do
      frame = Frame.new("2|/")
      expect(frame.is_strike?).to be_falsey
    end

  end

  context "strikes" do

    it "X|" do
      frame = Frame.new("X|")
      expect(frame.is_spare?).to be_falsey
    end

    it "|X" do
      frame = Frame.new("|X")
      expect(frame.roll_2).to eql("X")

      expect(frame.is_strike?).to be_truthy
      expect(frame.is_spare?).to be_falsey
    end

  end

  context "other no strikes no spare" do

    it "3|7" do
      frame = Frame.new("3|7")
      expect(frame.roll_1).to eql("3")
      expect(frame.roll_2).to eql("7")
      expect(frame.is_strike?).to be_falsey
      expect(frame.is_spare?).to be_falsey

    end
  end
end