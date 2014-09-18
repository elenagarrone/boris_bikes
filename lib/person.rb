require_relative 'bike_container'

class Person

	include BikeContainer

	def take(bike) 
		bikes << bike
	end

end
