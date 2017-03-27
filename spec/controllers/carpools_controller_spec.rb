require 'rails_helper'
include RandomData
include ControllerMacros

RSpec.describe CarpoolsController, type: :controller do
    
    let(:user) { create(:user) }
    let(:ride) { create(:ride) }
    let(:carpool) { create(:carpool) }
    
    

    describe "POST create" do
        login_user
        
        it "returns http success" do 
            post :create, ride_id: ride.id, carpool: { user_id: user.id, rider_number: RandomData.random_reserved_seats, total_payment: RandomData.random_total_amount }
            expect(response).to have_http_status(:success)
        end
        
        it "increases the number of Carpool by 1" do
            expect{post :create, ride_id: ride.id, carpool: { user_id: user.id, rider_number: RandomData.random_reserved_seats, total_payment: RandomData.random_total_amount }}.to change(Carpool, :count).by(1)
        end
        
        it "assigns the new carpool to @carpool" do
            post :create, ride_id: ride.id, carpool: { user_id: user.id, rider_number: RandomData.random_reserved_seats, total_payment: RandomData.random_total_amount }
            expect(assigns(:carpool)).to eq Carpool.last
        end
        
        it "sends two emails" do
            expect { post :create, ride_id: ride.id, carpool: { user_id: user.id, rider_number: RandomData.random_reserved_seats, total_payment: RandomData.random_total_amount }}.to change{ActionMailer::Base.deliveries.count}.by(2)
        end
        
        it "sends email to driver" do
            post :create, ride_id: ride.id, carpool: { user_id: user.id, rider_number: RandomData.random_reserved_seats, total_payment: RandomData.random_total_amount }
            
            puts ActionMailer::Base.deliveries[-1].to
            puts ride.user.email
            
            driver_email = ActionMailer::Base.deliveries[-1]
            expect(driver_email.to).to eq [ride.user.email]
        end
        
        
        
        it "sends email to rider" do
            post :create, ride_id: ride.id, carpool: { user_id: user.id, rider_number: RandomData.random_reserved_seats, total_payment: RandomData.random_total_amount }
            
            rider_email = ActionMailer::Base.deliveries.last
            expect(rider_email.to).to eq [carpool.user.email]
            
        end
        
    end
    

end
