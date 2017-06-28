class Game
  def initialize
    @score = []
  end

  def reset
    @score = []
  end

  def add_roll(pin_count)
    @score << pin_count
    @score << 0 if pin_count == 10
  end

  def score
    @extra_points = @score.map.with_index do |pin_count, index|
      if (index == 0) || (index == 1) # cannot recieve extra points on first frame
        0
      elsif ((4..19).include?(index)) && (@score[index - 2] == 10) && (@score[index - 4] == 10) # roll following two strikes
        pin_count * 2
      elsif (index < 22) && (@score[index - 2] == 10) && (index % 2 == 0) # roll following strike
        pin_count
      elsif (@score[index - 3] == 10) && (index % 2 == 1) # second roll following strike
        pin_count
      elsif index % 2 == 1 # second roll in frame not following strike
        0
      elsif ((@score[index - 1] + @score[index - 2]) == 10) && (index < 20) # roll following a spare
        pin_count
      else
        0
      end
    end
    @score.sum + @extra_points.sum
  end
end
