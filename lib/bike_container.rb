module BikeContainer

	DEFAULT_CAPACITY = 10

	attr_writer :capacity

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def bike_count
		bikes.count
  end

  def dock(bike)
		raise "Station is full" if full?
    raise "Sorry, you didn't return a bike - try again" unless bike
		bikes << bike
  end

  def release(bike)
    raise "Sorry, no bikes are available - try again later." if available_bikes == 0
		bikes.delete(bike)
  end

  def release_available_bikes
    available_bikes.each { |bike| release bike }
  end

  def release_broken_bikes
    broken_bikes.each { |bike| release bike }
  end

  def full?
		bike_count == capacity
  end

  def empty?
    bike_count = 0
  end

  def available_bikes
		bikes.reject &:broken?
  end

  def broken_bikes
    bikes.select &:broken?
  end

end
