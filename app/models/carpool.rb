class Carpool < ActiveRecord::Base
    
    belongs_to :ride
    has_many :users
    has_many :messages

    
    def self.rides
        Rides.where( id: pluck(:ride_id) )
    end
    
    def self.users
        Users.where( id: pluck(:user_id) )
    end
    
    def user
        User.find(user_id)
    end
    
    def ride
        Ride.find(ride_id)
    end
    
    
end
