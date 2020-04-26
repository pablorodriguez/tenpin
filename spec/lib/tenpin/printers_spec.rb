require 'spec_helper'

RSpec.describe BaseReportPrinter do

  context "test" do
    it "print" do
      player1 = Player.new("Pablo","8|/ 7|/ 3|4 X| 2|/ X| X| 8|- X| 8|/|9")
      player2 = Player.new("Luis","|X 7|/ 9|0 |X 0|8 8|/ F|6 |X |X X|8|1")
      player3 = Player.new("Mario","3|/ 7|/ 5|4 3|/ 2|/ X| X| 8|- X| 8|/|9")
      game = Game.new([player1,player2,player3])
      puts TextGamePrinter.new(game).format
      puts AdvanceGamePrinter.new(game).format
      puts AdvanceGamePrinter.new(game,:unicode).format
    end

  end

end