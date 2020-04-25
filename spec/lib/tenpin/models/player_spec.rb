require 'spec_helper'

RSpec.describe  do

  context "player" do

    context "must contains 10 frames" do
      let(:player) { Player.new("Pablo","8|/ 7|/ 3|4 X| 2|/ X| X| 8|- X| 8|/|9") }
      it "must contains 10 frames" do
        expect(player.frames.size).to eq(10)
      end
    end

    context "with 8|/ 8|/ 3|4 X| X| 8|- X| 8|/|9 points" do
      let(:player) { Player.new("Pablo","8|/ 7|/ 3|4 X| 2|/ X| X| 8|- X| 8|/|9") }

      it "its score must be 170" do
        expect(player.score).to eq(170)
      end

    end

    context "with X| X| X| X| X| X| X| X| X| X| points" do

      let(:player) { Player.new("Pablo","X| X| X| X| X| X| X| X| X| X|X|X") }

      it "its score must be 300" do
        expect(player.score).to eq(300)
      end

    end

    context "with 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| points" do

      let(:player) { Player.new("Pablo","0| 0| 0| 0| 0| 0| 0| 0| 0| 0|0|") }

      it "its score must be 0" do
        expect(player.score).to eq(0)
      end

    end

    context "with |X 7|/ 9|0 |X 0|8 8|/ F|6 |X |X X|8|1 points" do

      let(:player) { Player.new("Pablo","|X 7|/ 9|0 |X 0|8 8|/ F|6 |X |X X|8|1") }

      it "its score must be 167" do
        expect(player.score).to eq(167)
      end

    end

    context "with |X 2|/ 9|0 |X 0|8 8|/ F|6 |X |X X|8|2 points" do

      let(:player) { Player.new("Pablo","|X 2|/ 9|0 |X 0|8 8|/ F|6 |X |X X|8|2") }

      it "its score must be 168" do
        expect(player.score).to eq(168)
      end

    end

    context "with |X 7|/ 9|0 |X 0|8 8|/ F|6 |X |X X|X|2 points" do

      let(:player) { Player.new("Pablo","|X 7|/ 9|0 |X 0|8 8|/ F|6 |X |X X|X|2") }

      it "its score must be 172" do
        expect(player.score).to eq(172)
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