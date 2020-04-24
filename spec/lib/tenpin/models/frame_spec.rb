require 'spec_helper'

RSpec.describe Frame do

  context "frame is spread" do

    let(:frame) {FactoryBot.build(:frame_spread)}

    it "when all pin are down with two frames" do
      expect(frame.is_spare?).to be_truthy
    end

    it "when pint down are 10 in two frames" do
      expect(frame.roll_1 + frame.roll_2).to eq(10);
      expect(frame.all_down?).to be_truthy
    end

    it "when there is not strike" do
      expect(frame.is_strike?).to be_falsey
    end

    it "first roll can`t be 10" do
      frame = Frame.new(10)
      expect(frame.is_spare?).to be_falsey
    end

  end

  context "frame is strike" do

    let(:frame) {FactoryBot.build(:frame_strike)}

    it "only when first roll is 10" do
      expect(frame.is_strike?).to be_truthy
      expect(frame.roll_2).to be(0)
      expect(frame.is_spare?).to be_falsey
    end

  end
end