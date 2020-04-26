class FramesDataParser

  def self.parse(data)
    players = []
    data.keys.each do |key|
      frames_str = data[key][:frames].join(" ")
      player = Player.new(key, frames_str)
      players << player
    end
    players
  end
end