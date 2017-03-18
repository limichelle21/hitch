class CarpoolMailer < ApplicationMailer
    default from: 'notifications@example.com'
    
    
    def book_ride_email(user, ride, carpool)
        @ride = ride
        @user = user
        @carpool = carpool
        @url = 'http://hitch.com/carpools/#{@carpool.id}/messages/new'
        mail(to: @user.email, subject: 'Hitch - New Passenger Added')
    end

    
    def confirm_ride_email(user, ride, carpool)
        @ride = ride
        @carpool = carpool
        @user = user
        @url = 'http://hitch.com/carpools/#{@carpool.id}/messages/new'
        mail(to: @user.email, subject: 'Hitch - Ride Confirmed')
        # send email to passenger with confirmation/Payment ID
    end
        
# Functions when a passenger cancels ride - Carpool Model
        
    # how to account for which carpool IF there are multiple carpools to a ride?
    
    def cancel_ride_email(user, ride, carpool)
        @ride = ride
        @user = @ride.user
        @carpool = @ride.carpool.find(params[:id])
        mail(to: @user.email, subject: 'Hitch - Passenger Cancelled')
    end
    
    
end




