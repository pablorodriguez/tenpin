class Player
  attr_accessor :frames, :name, :score

  def initialize(name, frames_str=nil)
    @name = name
    @frames = []
    init_frames_from_str(frames_str) if frames_str
    @score = calculate_score
  end

  private

  #8|/  7|/  3|4  X|  2|/  X|  X|  8|- X|  8|/|9
  def init_frames_from_str str
    str.split(' ').each do |fr_str|
      @frames << Frame.new(fr_str)
    end
  end

  def calculate_score
    acc = 0
    frames.each_with_index do | fr, index|
      if index < 9
        fr_next = frames[index+1]
        fr.score = acc + fr.points

        if fr.is_spare?
          fr.score += (fr_next.is_strike? ? fr_next.points : fr_next.roll_1.to_i)
        elsif fr.is_strike?
          fr.score += fr_next.points

          if fr_next.is_strike?
            if index == 8
              fr.score += (fr_next.roll_2 == 'X' ? 10 : fr_next.roll_2.to_i )
            else
              fr.score += frames[index+2].points
            end
          end
        end
      else
        fr.score = acc + fr.points_last_frame
      end
      acc = fr.score
    end

    acc

  end

end