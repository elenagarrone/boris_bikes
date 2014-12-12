require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def accept_bikes_from(van)
   	van.available_bikes.each {|bike| dock(bike); van.release(bike)}
  end

end
