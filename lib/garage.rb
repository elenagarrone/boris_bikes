require_relative 'bike_container'

class Garage

	 include BikeContainer

	 def dock(bike)
	 	bike.fix!
	 	super
	 end



	 # def fix_bikes
	 # 	bikes.each do |bike|
	 # 		bike.fix!
	 # 	end
	 # end

end

