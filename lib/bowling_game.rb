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
      @frame_score = frame_score frame
      if is_strike frame
        score_strike @frames, index
      elsif is_spare frame
        score_spare @frames, index
      else
        @score += @frame_score
      end
    }
    @score
  end

  private
  def convert_rolls_to_frames
    frame_count = 0
    @rolls.each_with_index { |roll, index|
      if is_strike_roll frame_count, roll
        @frames << [@rolls[index]]
      elsif frame_count == 1
        @frames << [@rolls[index-1], @rolls[index]]
        frame_count = 0
      else
        frame_count += 1
      end
    }
  end

  def is_spare(frame)
    frame.inject(:+) == 10
  end

  def score_spare(frames, index)
    bonus = frames[index + 1][0]
    @score += frame_score(frames[index]) + bonus
  end

  def score_strike(frames, index)
    bonus = frame_score frames[index + 1]
    @score += frame_score(frames[index]) + bonus
  end

  def is_strike(frame)
    frame.size == 1
  end

  def is_strike_roll(frame_count, roll)
    frame_count == 0 && roll == 10
  end

  def frame_score frame
    frame.inject(:+)
  end
end
