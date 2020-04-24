class Frame
  attr_accessor :roll_1, :roll_2, :roll_3, :score

  def initialize(roll_1=0, roll_2=0, roll_3=nil)
    @roll_1 = roll_1 == 'F' ? '0' : roll_1
    @roll_2 = roll_2 == 'F' ? '0' : roll_2
    @roll_3 = roll_3 == 'F' ? '0' : roll_3
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

end
