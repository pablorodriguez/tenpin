class Frame
  attr_accessor :roll_1, :roll_2, :roll_3, :score, :roll_str

  def initialize(str)
    @roll_1 = 0
    @roll_2 = 0
    @roll_str = str.gsub("F","0").gsub("10","X")
    if valid_data(@roll_str)
      @roll_str.split("|").each_with_index do |val, index|
        val = normalize_to_text(val, index)
        self.send("roll_#{index+1}=", val)
      end
    end

    @score = 0
  end

  def is_strike?
    roll_1 == 'X'|| roll_2 == 'X'
  end

  def is_spare?
    roll_2 == '/'
  end

  def points
    is_strike? || is_spare? ? 10 :  (@roll_1.to_i + @roll_2.to_i)
  end

  def points_last_frame
    acc = points

    acc += 10 if roll_1 == 'X' && roll_2 == 'X'
    acc += roll_2.to_i if roll_1 == 'X' && roll_2.to_i > 0
    acc += 10 if roll_3 == 'X' || roll_3 == '/'
    acc += roll_3.to_i if roll_3.to_i > 0

    acc
  end

  private

  def normalize_to_text(val, index)
    if (index == 1)
      pre_val = self.send("roll_1")
      if ((pre_val.to_i + val.to_i) == 10)
        val= '/'
      end
    end
    val
  end

  def valid_data(str)
    return true if str == 'X'
    return false if in_valid_length(str)
    return false if str.count("|") == 0
    return false if str.count("/") > 1
    return false if str.count("X") > 1 && str.length < 4
    true
  end

  def in_valid_length(str)
    return true if str.length < 2
    return true if str.length > 6
    false
  end

end
