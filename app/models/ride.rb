class Ride < ActiveRecord::Base
    
    belongs_to User
    has_one Carpool
    
    def seats_left
        # calculate number of available seats
    end
    
    def total_amount
    end
    
    
# Functions when a passenger books ride
    
    def book_ride_email
        # send email to driver when passenger books
    end
    
    def confirm_ride_email
        # send email to passenger with confirmation/Payment ID
    end
    
    def add_payment
        # add seat_price times number of seats to Payment value
    end
    
        
# Functions when a passenger cancels ride
        
    def cancel_ride_email
        # send email to driver when passenger cancels
    end
    
    def refund
        # refund payment to Passenger
    end
        
        
# Functions when ride is completed
        
    def ride_completed?
        # compare ride_date with current_date
        # if ride_date > current_date, marke ride.completed as TRUE
    end
    
    def driver_payment
        # store ride total in Driver's account?
    end
end
