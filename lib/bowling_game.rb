class Game

  def initialize
    @score = 0
    @rolls = []
    @frames = []
  end

  def roll pins
    @rolls << pins
  end

  def score
    convert_rolls_to_frames
    @frames.each_with_index { |frame, index|
      @frame_score = frame.inject(:+)
      if is_spare frame
        score_spare @frames, index
      else
        @score += @frame_score
      end
    }
    @score
  end

  def convert_rolls_to_frames
    (0..19).reject(&:odd?).each { |x|
      @frames << @rolls.slice(x, 2)
    }
  end

  def is_spare(frame)
    frame.inject(:+) == 10
  end

  def score_spare(frames, index)
    bonus = frames[index + 1][0]
    @score += @frame_score + bonus
  end

end
