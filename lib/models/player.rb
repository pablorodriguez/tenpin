class Player
  attr_accessor :frames, :name, :score

  def initialize(name, frames_str=nil)
    @frames = []
    init_frames_from_str(frames_str) if frames_str
    @score = calculate_score
  end

  private

  #8|/  7|/  3|4  X|  2|/  X|  X|  8|- X|  8|/|9
  def init_frames_from_str str
    str.split(' ').each do |fr|
      _frame = Frame.new
      fr.split("|").each_with_index do |val, index|
        _frame.send("roll_#{index+1}=", val)
      end
      @frames << _frame
    end
  end

  def calculate_score
    acc = 0
    frames.each_with_index do | fr, index|
      if index != 9
        if fr.is_spare?
          fr.score = acc + 10 + (frames[index+1].is_strike? ? 10 : frames[index+1].roll_1.to_i)
        elsif fr.is_strike?
          if frames[index+1].is_strike?
            if index < 8
              fr.score = acc + 10 + 10 + frames[index+2].points
            else
              fr.score = acc + 10 + 10 + (frames[index+1].roll_2 == 'X' ? 10 : frames[index+1].roll_2.to_i )
            end
          elsif frames[index+1].is_spare?
            fr.score = acc + 10 + frames[index+1].points
          else
            fr.score = acc + 10 + frames[index+1].points
          end
        else
          fr.score = acc + fr.points
        end
      else
        fr.score = acc + points_last_frame(fr)
      end
      acc = fr.score
    end

    acc

  end

  def points_last_frame(fr)
    acc = 0
    acc += 10 if fr.roll_1 == 'X'
    acc += 10 if fr.roll_2 == 'X'
    acc += 10 if fr.roll_3 == 'X'

    if fr.roll_1 != 'X' && fr.roll_2 == '/'
      acc += 10
      acc += (fr.roll_3 == 'X') ? 10 : fr.roll_3.to_i
    end

    if fr.roll_1 != 'X' && fr.roll_2 != 'X' && fr.roll_2 != '/' && fr.roll_3 == '/'
      acc += 10
    end

    if fr.roll_1 == 'X' && fr.roll_2 != 'X' && fr.roll_3 != 'X' && fr.roll_2 != '/' && fr.roll_3 != '/'
      acc += fr.roll_2.to_i + fr.roll_3.to_i
    end

    if fr.roll_1 != 'X' && fr.roll_2 != 'X' && fr.roll_3 != 'X' && fr.roll_1 != '/' && fr.roll_2 != '/' && fr.roll_3 != '/'
      acc += fr.roll_1.to_i +  fr.roll_2.to_i + fr.roll_3.to_i
    end


    acc
  end


end