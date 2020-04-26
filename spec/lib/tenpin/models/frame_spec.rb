require 'spec_helper'

RSpec.describe Frame do

  context "with number" do

    it '10|8|1 is a strike' do
      fr = Frame.new('10|8|1')
      expect(fr.is_strike?).to be_truthy
      expect(fr.points_last_frame).to eq(19)
    end

    it '10 is a strike' do
      frame = Frame.new('10')
      expect(frame.is_strike?).to be_truthy
    end

    it '10| is a strike' do
      frame = Frame.new('10|')
      expect(frame.is_strike?).to be_truthy
    end

    it '|10 is a strike' do
      frame = Frame.new('|10')
      expect(frame.is_strike?).to be_truthy
    end

    it '3|7 is a spare' do
      fr = Frame.new('3|7')
      expect(fr.is_spare?).to be_truthy
    end

    it '3|/ is a spare' do
      frame = Frame.new('3|/')
      expect(frame.is_spare?).to be_truthy
    end

    it '|7 not a spare neither strike' do
      frame = Frame.new('|7')
      expect(frame.is_spare?).to be_falsey
      expect(frame.is_strike?).to be_falsey
      expect(frame.points).to eql(7)
    end

    it '2|7 not a spare neither strike' do
      frame = Frame.new('2|7')
      expect(frame.is_spare?).to be_falsey
      expect(frame.is_strike?).to be_falsey
      expect(frame.points).to eql(9)
    end

    it "3|7 not a spare neither strike" do
      frame = Frame.new("3|5")
      expect(frame.roll_1).to eql("3")
      expect(frame.roll_2).to eql("5")
      expect(frame.points).to eql(8)
      expect(frame.is_strike?).to be_falsey
      expect(frame.is_spare?).to be_falsey
    end


    it "3|7 points is 8" do
      frame = Frame.new("3|5")
      expect(frame.roll_1).to eql("3")
      expect(frame.roll_2).to eql("5")
      expect(frame.points).to eql(8)
    end


  end

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

end