class Carpool < ActiveRecord::Base
    
    belongs_to :ride
    belongs_to :user # associated with a passenger
    has_many :messages

    validates :user, presence: true
    validates :ride, presence: true
    
    
    # when Carpool is created, call the carpool.ride.update_reserved_seat

    
    
# Functions when a passenger cancels ride - Carpool Model

    def refund
        # refund payment to Passenger
    end
        
    
    
end
