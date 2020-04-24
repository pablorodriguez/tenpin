class Score
  attr_accessor :frame_one, :frame_two

  def initialize(frame_one = Frame.new, frame_two = Frame.new)
    @frame_one = frame_one
    @frame_two = frame_two
  end
end