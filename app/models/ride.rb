class Ride < ActiveRecord::Base
    
    include Filterable
    
    belongs_to :user # driver User
    has_many :carpools
    has_many :users, through: :carpools
    
    validates :user, presence: true
    
    
    # Searching with Scopes
    
    scope :date, -> (ride_date) { where ride_date: ride_date }
    scope :departure, -> (departure_location) { where departure_location: departure_location }
    scope :arrival, -> (arrival_location) { where arrival_location: arrival_location }
    
    
    
    # Calculate the number of available seats
    def seats_left
        available_seats = (total_seats - reserved_seats)
    end
    
    
    # Calculate the running total of total_ride_amount based on number of Carpools
    def update_amount(carpools)
        total = carpools.collect { |c| c.present? ? c.total_payment : 0 }.sum 
        update_attribute(:total_ride_amount, total)
    end
    
    
# Functions when a passenger books ride - Carpool create
    
    def book_ride_email
        # send email to driver when passenger books
    end
    
    def confirm_ride_email
        # send email to passenger with confirmation/Payment ID
    end
        
# Functions when a passenger cancels ride - Carpool delete
        
    def cancel_ride_email
        # send email to driver when passenger cancels
    end
    
    def refund
        # refund payment to Passenger
    end
        
        
# Functions when ride is completed
        
    # compare ride_date with current_date - check every day
    # if ride_date > current_date, marke ride.completed as TRUE
    def ride_completed?
        ride_date > Time.now ? completed = true : completed = false     
    end
    
    def driver_payment
        # store ride total in Driver's account?
    end
end
