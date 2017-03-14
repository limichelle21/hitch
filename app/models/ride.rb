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
    
    
    
    # Update reserved seats attributte
    def update_reserved_seats
        reserved = carpools.sum(:rider_number)
        self.update_attribute(:reserved_seats, reserved)
        reserved_seats
    end
    
    
    # Calculate the number of available seats
    def seats_left
        available_seats = total_seats - reserved_seats
    end

    # Calculate the running total of total_ride_amount based on number of Carpools
    def update_amount
        total = carpools.collect { |c| c.present? ? c.total_payment : 0 }.sum
        update_attribute(:total_ride_amount, total)
        total_ride_amount
    end
    
    # Update a ride's booked status when carpools reserved
    def update_booked
        carpools.present? ? update_attribute(:booked, true) : update_attribute(:booked, false)
    end
    

        
# Functions when ride is completed
        
    # compare ride_date with current_date - check every day
    # if ride_date > current_date, marke ride.completed as TRUE
    def ride_completed?
        @current_date = Time.now
        ride_date > @current_date ? update_attribute(:completed, true) : update_attribute(:completed, false)     
    end
    
    def driver_payment
        # store ride total in Driver's account?
    end
end
