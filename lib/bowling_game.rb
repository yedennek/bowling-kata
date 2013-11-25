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
    @frames.each { |x|
      @frame_score =  x.inject(:+)
      @score += @frame_score
    }
    @score
  end

  def convert_rolls_to_frames
    (0..19).reject(&:odd?).each { |x|
      @frames << @rolls.slice(x, 2)
    }
  end
end
