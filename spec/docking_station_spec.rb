require 'docking_station'

describe DockingStation do

	let(:station) { DockingStation.new(:capacity => 123) }
  let(:fixed_bike) {Bike.new}
  let(:van) {Van.new}
	
    it "should allow setting default capacity on initialising" do
      expect(station.capacity).to eq(123)
    end 

    it "should accept only fixed bikes from the van" do
     van.dock(fixed_bike)
     station.accept_bikes_from(van)
     expect(station.bikes).to eq [fixed_bike]
     expect(van.bikes).to eq []
    end
    
end