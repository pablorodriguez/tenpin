class Frame
  attr_accessor :roll_1, :roll_2, :roll_3, :score, :roll_str

  def initialize(str)
    @roll_1 = 0
    @roll_2 = 0
    @roll_str = str
    @roll_str.gsub!("F","0")

    if valid_data(@roll_str)
      @roll_str.split("|").each_with_index do |val, index|
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
    acc = roll_str.count("X") * 10 # X|X|X

    if roll_1 != 'X' && roll_2 == '/' && roll_3 == 'X' # 2|/|X
      acc += 10 + 10
    end

    if roll_1 != 'X' && roll_2 == '/' && roll_3 != 'X' && roll_3 != '/' # 2|/|2
      acc += 10 + roll_3.to_i
    end

    if roll_1 != 'X' && roll_2 != 'X' && roll_2 != '/' && roll_3 == '/' # 2|2|/
      acc += 10
    end

    if roll_1 == 'X' && roll_2 == 'X' && roll_3 != 'X' && roll_3 != '/' #X|X|2
      acc += roll_3.to_i
    end

    if roll_1 == 'X' && roll_2 != 'X' && roll_3 != 'X' && roll_2 != '/' && roll_3 != '/' # X|2|2
      acc += roll_2.to_i + roll_3.to_i
    end

    if roll_1 != 'X' && roll_2 != 'X' && roll_3 != 'X' && roll_1 != '/' && roll_2 != '/' && roll_3 != '/' # 2|3|4
      acc += roll_1.to_i +  roll_2.to_i + roll_3.to_i
    end

    acc
  end

  private

  def valid_data(str)
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
