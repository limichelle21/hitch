require 'rails_helper'

RSpec.describe Ride, type: :model do
    let(:ride) { create(:ride) }
    let(:user) { create(:user) }

    it { should belong_to(:user) }
    it { should have_many(:carpools) }
    it { should have_many(:users) }
    it { should validate_presence_of(:user) }
    
    
    it "returns an array of results that match search parameters" do
    end
    
    
    
    describe "saving carpool information to rides" do
        before do
            @carpools = [1, 2, 1]
            @carpools.each do |c|
                create :carpool, user: user, ride: ride, rider_number: c, total_payment: (ride.seat_price * c)
            end
            ride.reserved_seats = @carpools.sum(:rider_number)
            ride.available_seats = ride.total_seats - ride.reserved_seats
            
            
            ride.reload
        end
        
        describe "#update_reserved_seats" do
            it "updates the reserved_seats attribute" do
                @reserved_seats = ride.carpools.sum(:rider_number)
                expect(ride.update_reserved_seats).to eq(@reserved_seats)
            end
        end
        
        # the reserved_seats attribute is saved when Ride is created in the factory
        
        describe "#update_amount" do
            it "returns count of a ride's carpools" do
                @carpools = ride.carpools.count
                expect(ride.carpools.count).to eq(@carpools)
            end

            it "updates total ride amount" do 
                @total = ride.carpools.sum(:total_payment)
                expect(ride.update_amount).to eq(@total)
            end
        end 
        
        describe "#seats_left" do
            it "returns the correct number of seats left" do
  
                @available = ride.available_seats
                expect(ride.seats_left).to eq(@available_seats)
            end
        end
        
    end
    
    
    
    
    describe "#ride_completed" do
        it "should mark a past ride complete" do
            @current_date = "Mon, 13 Mar 2017"
            expect(ride.completed?).to eq(true)
        end
    end

end
