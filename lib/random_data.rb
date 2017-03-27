module RandomData
 
# General Random Data
    
    def self.random_boolean
        [true, false].sample
    end

    def self.paragraph
        "Hey, can we change the pick up time?"
    end
    
# User Random Data    


    def self.random_rating
        [1, 2, 3, 4, 5].sample
    end
    
    def self.random_card_type
        ["Visa", "MasterCard", "American Express"].sample
    end

# Ride Random Data
    
    def self.random_seat_price
        [20.00, 15.00, 30.00, 35.00].sample
    end
    
    def self.random_total_seats
        [3, 4, 5].sample
    end
    
    def self.random_reserved_seats
        [1, 2, 3].sample
    end
    
    def self.random_available_seats
        [1, 2, 3].sample
    end

    def self.random_total_amount
        [100.00, 80.00, 70.00, 60.00].sample
    end

    # Data for Ride Controller Spec
    
    def self.random_date
        5.days.ago
    end
    
    def self.random_departure
        ["Los Angeles", "San Francisco", "Portland", "Seattle"].sample
    end
    
    def self.random_arrival
        ["Las Vegas", "Corvallis", "San Jose", "Sacramento"].sample
    end
    
    
    
    

end
