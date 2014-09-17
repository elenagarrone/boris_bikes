require 'van'
require 'bike_container'
require 'bike'
require 'garage'

def fill_van(van)
    van.capacity.times { van.dock (Bike.new) }
end

describe Van do

	let(:bike) {Bike.new}
	let(:van) {Van.new}
   
   it "has no broken bikes"do
     expect(van.broken_bikes).to eq []
   end

   it "should know when it's full" do
     expect(van).not_to be_full
     fill_van van
   end

   it "should not accept a bike if it's full" do
      fill_van van
      expect(lambda { van.dock(bike) }).to raise_error(RuntimeError)
   end

   it "should release a bike to the garage" do
   	  bike.break!
      van.dock(bike)
      van.release(bike)
      expect(van.bike_count).to eq(0)
   end
   
   it "should accept fixed bikes" do
        bike.break!
    	van.dock(bike)
    	expect(bike).to be_broken
   end

   it "should release a bike to the garage" do
   	  bike.break!
      van.dock(bike)
      van.release(bike)
      expect(van.bike_count).to eq(0)
   end

end