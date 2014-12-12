require 'bike_container'

class ContainerHolder; include BikeContainer; end

def fill_holder(holder)
    holder.capacity.times { holder.dock (Bike.new) }
end

describe BikeContainer do

	let(:bike)   { Bike.new }
	let(:holder) { ContainerHolder.new }

  it "should accept a bike" do
  	expect{ holder.dock(bike) }.to change{ holder.bike_count }.by 1
  end

  it "should release a bike" do
    holder.dock(bike)
    holder.release_available_bikes
    expect(holder.bike_count).to equal(0)
  end

  it "should know when it's full" do
    expect(holder).not_to be_full
  end

  it "should not accept a bike if it's full" do
    fill_holder holder
    expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
  end

  it "should provide the list of available bikes" do
  	working_bike, broken_bike = Bike.new, Bike.broken
  	holder.dock(working_bike)
  	holder.dock(broken_bike)
  	expect(holder.available_bikes).to eq([working_bike])
  end

  it "should provide the list of broken bikes" do
    broken_bike = Bike.broken
    holder.dock(broken_bike)
    expect(holder.broken_bikes).to eq([broken_bike])
  end

end
