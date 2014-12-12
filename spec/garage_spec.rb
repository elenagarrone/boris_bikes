require 'garage'
require 'bike_container'
require 'bike'

describe Garage do

	let(:bike)        {Bike.new}
	let(:garage)      {Garage.new}
	let(:van)         {Van.new}
	let(:broken_bike) {Bike.broken}

  it "should collect only broken bikes from the van and fix them" do
   van.dock(broken_bike)
   garage.collect_from(van)
   expect(garage.bikes).to eq [broken_bike]
   expect(van.bikes).to eq []
  end

end
