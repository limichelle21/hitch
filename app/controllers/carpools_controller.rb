class CarpoolsController < ApplicationController

    before_action :get_ride
    before_action :get_user
    
    
    def new
      @carpool = Carpool.new
    end


    # how to save an instance of carpool to both ride and user?    

    def create
      @carpool = Carpool.new
      @carpool = @ride.build(carpool_params)    

       if @carpool.save
          CarpoolMailer.book_ride_email(@ride.user, @ride, @carpool)
          CarpoolMailer.confirm_ride_email(@user, @ride, @carpool)   
          redirect_to carpool_messages_path
        else
          flash[:notice] = "There was an error saving your ride."
          render :new
      end
    end
    
    
    
    private

     def carpool_params
        params.require(:carpool).permit(:user, :rider_number, :total_payment)
    end


    def get_ride
        @ride = Ride.find(params[:id])
    end
    
    def get_user
        @user = current_user
    end
    
end
