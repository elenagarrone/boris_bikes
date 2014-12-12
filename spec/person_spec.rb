require 'person'
require 'docking_station'
require 'bike'

describe Person do

  let(:bike)    {Bike.new}
  let(:person)  {Person.new}
  let(:station) {DockingStation.new}

  it "should be able to rent a bike" do
    station.dock(bike)
    station.release(bike)
    person.take(bike)
    expect(person.bikes).to eq [bike]
  end

  it "should be able to return the bike" do
    person.take(bike)
    person.release(bike)
    station.dock(bike)
    expect(person.bikes).to eq []
    expect(station.bikes).to eq [bike]
  end

end
