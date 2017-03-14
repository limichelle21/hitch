class Carpool < ActiveRecord::Base
    
    belongs_to :ride
    belongs_to :user
    has_many :messages

    validates :user, presence: true
    validates :ride, presence: true
    
    
    # when Carpool is created, call the carpool.ride.update_reserved_seat
    
    
    # Functions when a passenger books ride - Carpool Model 
    
    def book_ride_email
        # send email to driver when passenger books
    end
    
    def confirm_ride_email
        # send email to passenger with confirmation/Payment ID
    end
        
# Functions when a passenger cancels ride - Carpool Model
        
    def cancel_ride_email
        # send email to driver when passenger cancels
    end
    
    def refund
        # refund payment to Passenger
    end
        
    
    
end
