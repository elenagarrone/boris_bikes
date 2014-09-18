require_relative 'bike_container'

class Van

	 include BikeContainer

     def collect_from(station)
     	station.broken_bikes.each do |broken_bike|
     		dock(broken_bike)
     		station.release broken_bike
        end
     end

     def pick_up_from(garage)
     	garage.available_bikes.each do |fixed_bike|
     		dock(fixed_bike)
     		garage.release fixed_bike
        end
     end

end

