$:.unshift File.join(File.dirname(__FILE__), "..", "")
require 'test/unit'
require 'game'

class BowlingGameTest < Test::Unit::TestCase

	def setup
		@game = Game.new
	end
	
	def roll_many(nofTimes, pins)
		for _ in (1..nofTimes)
			@game.roll(pins)
		end
	end

	def test_gutter_game
		roll_many(20, 0)
		assert_equal 0, @game.score
	end

	def test_all_ones
		roll_many(20, 1)
		assert_equal 20, @game.score
	end
	
	def test_one_spare
		roll_spare
		@game.roll(3)
		roll_many(17, 0)
		assert_equal 16, @game.score
	end
	
	def test_one_strike
		roll_strike
		@game.roll(3)
		@game.roll(4)
		roll_many(17, 0)
		assert_equal 24, @game.score
	end
	
	def test_perfect_game
		roll_many(12, 10)
		assert_equal 300, @game.score
	end
	
	def roll_spare
		@game.roll(5)
		@game.roll(5)
	end
	
	def roll_strike
		@game.roll(10)
	end
end