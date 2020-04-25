class TextGamePrinter < BaseReportPrinter

  def format
    str = header
    str << body
    str
  end

  def body
    str = ""
    data.players.each do |player|
      str << "\n" + TextPlayerPrinter.new(player).format
    end
    str
  end

  def header
    str = "Frame".ljust(15, ' ')
    (0..9).each do |v|
      str << (v+1).to_s.ljust(5, ' ')
    end
    str
  end
end