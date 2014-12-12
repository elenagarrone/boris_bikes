require 'van'
require 'bike_container'
require 'bike'
require 'garage'
require 'docking_station'

def fill_van(van)
  van.capacity.times { van.dock (Bike.new) }
end

describe Van do

	let(:bike)           { Bike.new }
	let(:van)            { Van.new }
  let(:station)        { DockingStation.new }
  let(:broken_bike)    { Bike.broken }
  let(:garage)         { Garage.new }
  let(:shiny_red_bike) { Bike.broken }

  it "should know when it's full" do
   expect(van).not_to be_full
  end

  it "should not accept a bike if it's full" do
    fill_van van
    expect(lambda { van.dock(bike) }).to raise_error(RuntimeError)
  end

  it "should collect only broken bikes from the station" do
    station.dock(broken_bike)
    station.dock(bike)
    van.collect_from(station)
    expect(van.bikes).to eq [broken_bike]
    expect(station.bikes).to eq [bike]
  end

  it "should pick up the fixed bikes from the garage" do
    garage.dock(shiny_red_bike)
    van.pick_up_from(garage)
    expect(van.bikes).to eq [shiny_red_bike]
    expect(garage.bikes).to eq []
  end

  it "should release a fixed bike to the docking station" do
    van.dock(shiny_red_bike)
    van.release(shiny_red_bike)
    station.dock(shiny_red_bike)
    expect(van.bike_count).to eq(0)
    expect(station.bikes).to eq [shiny_red_bike]
  end

end
