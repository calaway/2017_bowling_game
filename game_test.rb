require './test_helper'
require './game'

reporter_options = {color: true}
Minitest::Reporters.use! #[Minitest::Reporters::DefaultReporter.new(reporter_options)]

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_20_rolls_of_0_is_0
    (1..20).each do |roll|
      @game.add_roll(0)
    end

    assert_equal(0, @game.score, "game score wrong for 0 pins")
  end

  def test_static_rolls_score_is_correct
    (1..9).each do |pin_count|
      (0..9).each do |frames|
        @game.add_roll(pin_count)
        @game.add_roll(0)
      end
      assert_equal(pin_count * 10, @game.score, "score is wrong first static test!")
      @game.reset
    end
  end


end
