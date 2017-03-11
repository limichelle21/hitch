class Ride < ActiveRecord::Base
    
    belongs_to :user # driver User
    has_many :carpools
    has_many :users, through: :carpools
    
    validates :user, presence: true
    
    
    # Calculate the number of available seats
    def seats_left
        available_seats = total_seats - reserved_seats
    end
    
    
    # Calculate the running total of total_ride_amount based on number of Carpools
    def total_amount
        total_ride_amount = carpools.collect { |c| c.present? ? c.total_payment : 0 }.sum 
    end
    
    
# Functions when a passenger books ride
    
    def book_ride_email
        # send email to driver when passenger books
    end
    
    def confirm_ride_email
        # send email to passenger with confirmation/Payment ID
    end
        
# Functions when a passenger cancels ride
        
    def cancel_ride_email
        # send email to driver when passenger cancels
    end
    
    def refund
        # refund payment to Passenger
    end
        
        
# Functions when ride is completed
        
    # compare ride_date with current_date
    # if ride_date > current_date, marke ride.completed as TRUE
    def ride_completed?
        ride_date > Time.now ? completed = true : completed = false     
    end
    
    def driver_payment
        # store ride total in Driver's account?
    end
end
