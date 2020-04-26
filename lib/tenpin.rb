#require(File.join(File.dirname(__FILE__), "tenpin/**/*"))
require("models/score")
require("models/game")
require("models/frame")
require("models/player")
require("printers/row_printer")
require("printers/base_report_printer")
require("printers/text_game_printer")
require("printers/text_player_printer")
require("printers/advance_game_printer")
require("imports/file_import")
require("imports/frames_data_parser")

class TenPin
  attr_accessor :printer

  def initialize(path_and_file=File.join(File.dirname(__FILE__),'tenpin_data.txt'), printer=TextGamePrinter.new)
    @file = path_and_file
    @printer = printer
  end

  def show
    print_scores(parse_data(read_data))
  end

  protected

  def read_data
    file = FileImport.new(@file)
    file.read
  end

  def parse_data(data)
    players = FramesDataParser.parse(data)
    game = Game.new(players)
  end

  def print_scores(game)
    printer.data = game
    puts printer.format
  end
end
