require_relative 'bike_container'

class Garage

  include BikeContainer

  def dock(bike)
    bike.fix!
    super
  end

  def collect_from(van)
    van.broken_bikes.each { |broken_bike| dock(broken_bike); van.release broken_bike }
  end

end
