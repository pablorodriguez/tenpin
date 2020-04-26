class AdvanceGamePrinter < BaseReportPrinter

  def initialize(game=nil,type=:ascii)
    super(game)
    @type = type
  end

  def header
    ['Frame','1','2','3','4','5','6','7','8','9','10']
  end

  def format
    table = TTY::Table.new(header: header)
    data.players.each do |player|
      table << [player.name,'','','','','','','','','','']
      row_data = body(player)
      table << row_data[0]
      table << row_data[1]
    end
    table.render(@type, width: 80, resize: true)
  end

  def body(player)
    pinfalls = ['Pinfalls']
    scores = ['Score']
    player.frames.each do |fr|
      pinfalls << "#{fr.roll_1} #{fr.roll_2} #{fr.roll_3} "
      scores << fr.score.to_s.ljust(5,' ')
    end
    return [pinfalls,scores]
  end
end