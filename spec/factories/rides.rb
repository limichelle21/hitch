include RandomData

FactoryGirl.define do
  factory :ride do
    ride_date { 5.days.ago }
    departure_location "San Francisco"
    arrival_location "Los Angeles"
    seat_price RandomData.random_seat_price
    total_seats RandomData.random_total_seats
    available_seats RandomData.random_available_seats
    reserved_seats RandomData.random_reserved_seats
    notes "I can take 3 people, leaving early in the morning"
    total_ride_amount RandomData.random_total_amount
    completed RandomData.random_boolean
    user 
    booked RandomData.random_boolean
  end
end


