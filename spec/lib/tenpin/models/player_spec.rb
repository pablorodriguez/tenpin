require 'spec_helper'

RSpec.describe  do

  context "player" do

    context "with 8|/ 8|/ 3|4 X| X| 8|- X| 8|/|9 points" do

      let(:player) { Player.new("Pablo","8|/ 7|/ 3|4 X| 2|/ X| X| 8|- X| 8|/|9") }

      it "its score must be 170" do
        expect(player.score).to eq(170)
      end

      it "must contains 10 frames" do
        expect(player.frames.size).to eq(10)
      end

    end

    context "with X| X| X| X| X| X| X| X| X| X| points" do

      let(:player) { Player.new("Pablo","X| X| X| X| X| X| X| X| X| X|X|X") }

      it "its score must be 300" do
        expect(player.score).to eq(300)
      end

    end

    context "with |X /|/ 9|0 |X 0|8 8|/ F|6 |X |X X|8|1 points" do

      let(:player) { Player.new("Pablo","|X /|/ 9|0 |X 0|8 8|/ F|6 |X |X X|8|1") }

      it "its score must be 167" do
        expect(player.score).to eq(167)
      end

    end

    context "with 3|/ 6|3 |X 8|1 |X |X 9|0 7|/ 4|4 X|9|0 points" do

      let(:player) { Player.new("Pablo","3|/ 6|3 |X 8|1 |X |X 9|0 7|/ 4|4 X|9|0") }

      it "its score must be 151" do
        expect(player.score).to eq(151)
      end

    end

  end

end