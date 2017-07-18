require 'rails_helper'
include RandomData
include ControllerMacros

RSpec.describe Api::V1::RidesController, type: :controller do

    let(:ride) { create(:ride) }
    let(:ride_complete) { create(:ride, completed: true) }
    let(:user) { create(:user) }


    describe "GET index" do
        it "returns http success" do
            get :index
            expect(response).to have_http_status(:success)
        end

        it "assigns Ride.all to ride" do
            get :index
            expect(assigns(:rides)).to eq([ride, ride_complete])
        end

        it "returns rides based on search params" do
        end

    end



    describe "GET show" do

        it "returns http success" do
            get :show, user_id: user.id, id: ride.id
            expect(response).to have_http_status(:success)
        end

        it "assigns ride to @ride" do
            get :show, user_id: user.id, id: ride.id
            expect(assigns(:ride)).to eq(ride)
        end

        it "renders the #show view" do
            get :show, user_id: user.id, id: ride.id
            expect(response).to render_template :show
        end

    end

    describe "GET new" do
        login_user

        it "returns http success" do
            get :new, user_id: user.id
            expect(response).to have_http_status(:success)
        end

        it "renders the #new view" do
            get :new, user_id: user.id
            expect(response).to render_template :new
        end

        it "instantiates @ride" do
            get :new, user_id: user.id
            expect(assigns(:ride)).not_to be_nil
        end

    end

    describe "POST create" do
        login_user

        it "returns http success" do

            post :create, user_id: user.id, ride: { ride_date: RandomData.random_date, departure_location: RandomData.random_departure, arrival_location: RandomData.random_arrival, seat_price: RandomData.random_seat_price, total_seats: RandomData.random_total_seats, notes: "Leaving at 9am" }


            expect(response).to have_http_status(:success)
        end



        it "assigns new ride to @ride" do

            post :create, user_id: user.id, ride: { ride_date: RandomData.random_date, departure_location: RandomData.random_departure, arrival_location: RandomData.random_arrival, seat_price: RandomData.random_seat_price, total_seats: RandomData.random_total_seats, notes: "Leaving at 9am" }


            expect(assigns(:ride)).to eq Ride.last
        end


#        it "redirects to the new ride" do
#            post :create, user_id: user.id
#            expect(response).to redirect_to [user, Ride.last]
#        end

    end

    describe "GET edit" do
        login_user

        it "returns http success" do
            get :edit, user_id: user.id, id: ride.id
            expect(response).to have_http_status(:success)
        end

        it "renders the #edit view" do
            get :edit, user_id: user.id, id: ride.id
            expect(response).to render_template :edit
        end

        it "assigns ride to be updated to @ride" do
            get :edit, user_id: user.id, id: ride.id
            ride_instance = assigns(:ride)

            expect(ride_instance.id).to eq ride.id
        end

    end

    describe "PUT update" do
        login_user

        it "updates ride with expected attributes" do
            new_departure = "Portland"
            new_ride_date = Time.now.strftime('%F')

            put :update, user_id: user.id, id: ride.id, ride: { departure_location: new_departure, ride_date: new_ride_date }
            updated_ride = assigns(:ride)

            expect(updated_ride.id).to eq ride.id
            expect(updated_ride.departure_location).to eq new_departure
            expect(updated_ride.ride_date.to_s).to eq new_ride_date
        end

        it "redirects to updated ride" do
        end


    end






end
