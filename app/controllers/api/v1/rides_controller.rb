class Api::V1::RidesController < ApiController

  respond_to :json
  before_action :authenticate_user!
  before_action :get_user, only: [:new, :create]


# return rides based on search params


  def index
    if params[:date] && params[:departure] && params[:arrival]
      # params[:date] = params[:date].to_date
      # @rides = Ride.filter(params.slice(:ride_date, :departure_location, :arrival_location))
      @rides = Ride.where("ride_date LIKE (?) AND departure_location LIKE (?) AND arrival_location LIKE (?)", params[:date].to_date, params[:departure], params[:arrival])
    else
      @rides = Ride.all
    end
    render json: @rides
  end


  def show
      @ride = Ride.find(params[:id])
      render json: @ride
  end

  def new
      @ride = Ride.new
      render json: @ride
  end

  def edit
      @ride = Ride.find(params[:id])
      render json: @ride
  end


# create ride post here
  def create
      @ride = @user.rides.build(ride_params)
      if @ride.save
          render json: @ride, status: 200
        else
          render json: {message: "There was an error"}, status: 400
      end
      render json: @ride
  end

  def update
      @ride = Ride.find(params[:id])
      @ride.assign_attributes(ride_params)

       if @ride.save
           render json: @ride, status: 200
        else
           render json: {message: "There was an error updating the ride. Please try again."}, status: 400
        end
      render json: @ride
  end

  def confirm_ride
      # process Stripe payment here, set ride.booked = true
  end


  private

    def ride_params
        params.require(:ride).permit(:ride_date, :departure_location, :arrival_location, :seat_price, :total_seats, :notes, :departure_time)
    end

    def search_params
        params.permit(:ride_date, :departure_location, :arrival_location)
    end

    def filtering_params(params)
        params.slice(:ride_date, :departure_location, :arrival_location)
    end


    def get_user
        # @user = current_api_user
        puts "><><><><><><><><><><>>><<<#{current_user.inspect}"
        # @user = User.find_by(auth_token: token)
    end

end
