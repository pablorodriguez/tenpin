class TextPlayerPrinter
  include RowPrinter

  attr_accessor :player

  def initialize(player)
    @player = player
  end

  def format
    str = player.name.ljust(15, ' ') + "\n" + "Pinfalls".ljust(15, ' ')
    score = "Score".ljust(15, ' ')
    player.frames.each do |fr|
      str << "#{fr.roll_1} #{fr.roll_2} #{fr.roll_3} "
      score << fr.score.to_s.ljust(5,' ')
    end
    str + "\n" + score

  end
end
