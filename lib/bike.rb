class Bike

	def initialize
		fix!
	end

	def broken?
		@broken
	end

	def break!
		@broken = true
	end

	def fix!
		@broken = false
	end

	def self.broken
		bike = Bike.new
		bike.break!
		bike
	end

end