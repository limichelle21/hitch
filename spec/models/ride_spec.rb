require 'rails_helper'

RSpec.describe Ride, type: :model do
    let(:ride) { create(:ride) }
    
    it { should belong_to(:user) }
    it { should have_many(:carpools) }
    it { should have_many(:users) }
    
    
    it { should validate_presence_of(:user) }
    
    
    describe "#seats_left(total_seats, reserved_seats)" do
        before do
            @available_seats = 2
        end
        
        it "returns the correct number of seats left" do
            expect(ride.available_seats).to eq(@available_seats)
        end
    end
    
    describe "#update_amount(carpools)" do
        
        before do
            # set carpool data?
        end
        
        
        it "retrieves the correct carpools associated with the ride" do
            expect(ride.carpools).to eq(3)
        end
        
        it "sums the payment amount of all carpools in the ride" do
            expect(ride.carpools.sum).to eq(100.00)
        end
        
        it "updates total ride amount" do 
            expect(ride.total_ride_amount).to eq(ride.carpools.sum)
        end
    end
    
    describe "#ride_completed" do
        let(:current_date) { }

        it "should mark a past ride complete" do
            expect(ride.completed).to eq(true)
        end
    end
    
    
end
