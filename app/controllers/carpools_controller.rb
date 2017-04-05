class CarpoolsController < ApplicationController
    respond_to :json
    
    before_action :get_ride
    before_action :get_user
    

    # how to save an instance of carpool to both ride and user?    
    
    def show
        @carpool = Carpool.find(params[:id])
        render json: @carpool, status: 200
    end
    

    def create
      @carpool = @ride.carpools.build(carpool_params)    
       if @carpool.save
          CarpoolMailer.book_ride_email(@ride.user, @ride, @carpool).deliver_now
          CarpoolMailer.confirm_ride_email(@user, @ride, @carpool).deliver_now   
          render json: @carpool, status: 200
        else
          render json: {message: "There was an error"}, status: 400
      end
        render json: @carpool
    end
    
    
    
    private

     def carpool_params
        params.require(:carpool).permit(:user_id, :rider_number, :total_payment)
    end


    def get_ride
        @ride = Ride.find(params[:ride_id])
    end
    
    def get_user
        @user = current_user
    end
    
end
