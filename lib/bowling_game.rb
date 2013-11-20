class Game

  def initialize
    @score = 0
    @rolls = []
  end

  def roll pins
    @rolls << pins
  end

  def score
    @rolls.inject(:+)
  end

end
