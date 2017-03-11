include RandomData

FactoryGirl.define do
  factory :carpool do
      user
      ride
      total_payment RandomData.random_total_amount
      rider_number RandomData.random_reserved_seats
    
  end
end
