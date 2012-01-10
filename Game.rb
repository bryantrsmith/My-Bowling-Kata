class Game

	def initialize()
		@score = 0
		@rolls = Array.new
		@current_roll = 0
	end

	def roll(pins)
		@score += pins
		@rolls[@current_roll] = pins
		@current_roll += 1
	end
	
	def score()
		score = 0
		frameIndex = 0
		for frame in 0..9
			if strike?(frameIndex)
				score += 10 + strike_bonus(frameIndex)
				frameIndex += 1
			elsif spare?(frameIndex)
				score += 10 + spare_bonus(frameIndex)
				frameIndex += 2
			else
				score += sum_of_balls_in_frame(frameIndex)
				frameIndex += 2
			end
		end
		return score
	end
	
	def strike_bonus(frameIndex)
		@rolls[frameIndex+1] + @rolls[frameIndex+2]
	end
	
	def spare_bonus(frameIndex)
		@rolls[frameIndex+2]
	end
	
	def sum_of_balls_in_frame(frameIndex)
		@rolls[frameIndex] + @rolls[frameIndex+1]
	end
	
	def spare?(frameIndex)
		@rolls[frameIndex] + @rolls[frameIndex+1] == 10
	end
	
	def strike?(frameIndex)
		@rolls[frameIndex] == 10
	end
end