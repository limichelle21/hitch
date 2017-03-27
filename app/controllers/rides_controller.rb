class RidesController < ApplicationController
    
  before_action :get_user, except: :show
    

# return rides based on search params    
  def index
      @rides = Ride.filter(params.slice(:date, :departure, :arrival))
  end

  def show
      @ride = Ride.find(params[:id])
  end

  def new
      @ride = Ride.new
  end
    
  def edit
      @ride = Ride.find(params[:id])
  end
    
    
# create ride post here
  def create
      @ride = @user.rides.build(ride_params)
      if @ride.save
          render json: @ride, status: 200
        else
          render json: {message: "There was an error"}, status: 400
      end
  end

  def update
      @ride = Ride.find(params[:id])
      @ride.assign_attributes(ride_params)
      
       if @ride.save
           render json: @ride, status: 200
        else
           render json: {message: "There was an error updating the ride. Please try again."}, status: 400
        end
  end
    
  def confirm_ride
      # process Stripe payment here, set ride.booked = true
  end

    
  private
  
    def ride_params
        params.require(:ride).permit(:ride_date, :departure_location, :arrival_location, :seat_price, :total_seats, :notes)
    end
    
    def filtering_params(params)
        params.slice(:date, :departure, :arrival)
    end
    
    
    def get_user
        @user = current_user
    end
    
end

