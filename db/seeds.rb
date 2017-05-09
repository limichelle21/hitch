# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include RandomData
include Faker

# Create Users

20.times do
    User.create!(
        username: Faker::Internet.user_name, 
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.phone_number,
        password: Faker::Internet.password,
        verified: RandomData.random_boolean,
        average_rating: RandomData.random_rating,
        payment_card_token: Faker::Lorem.characters(9),
        bank_account_token: Faker::Lorem.characters(9),
        card_type: RandomData.random_card_type,
        last_4: Faker::Number.number(4),
        uid: Faker::Lorem.characters(7)
        )
end

users = User.all


# Create Rides

30.times do
    Ride.create!(
        ride_date: Faker::Date.between(10.days.ago, 10.days.from_now),
        departure_location: Faker::Address.city,
        arrival_location: Faker::Address.city,
        seat_price: RandomData.random_seat_price,
        total_seats: RandomData.random_total_seats,
        available_seats: RandomData.random_available_seats,
        reserved_seats: RandomData.random_reserved_seats,
        notes: Faker::Lorem.sentence,
        total_ride_amount: RandomData.random_total_amount,
        completed: RandomData.random_boolean,
        user: users.sample,
        booked: RandomData.random_boolean,
        departure_time: Faker::Time.between(DateTime.now - 1, DateTime.now)
        )
end

rides = Ride.all


# Create Carpools

15.times do
    Carpool.create!(
        user: users.sample,
        ride: rides.sample,
        total_payment: RandomData.random_total_amount,
        rider_number: RandomData.random_reserved_seats
        )
end

carpools = Carpool.all


# Create Messages

20.times do 
    Message.create!(
        content: Faker::Lorem.sentence,
        sent_at: Faker::Time.between(2.days.ago, Date.today, :all),
        user: users.sample,
        carpool: carpools.sample
        )
    
end

messages = Message.all


# Create Ratings


10.times do
    Rating.create!(
        rating_value: RandomData.random_rating,
        rating_comment: Faker::Lorem.sentence,
        user: users.sample
        )
end

ratings = Rating.all



# Create Disbursements

5.times do
    Disbursement.create!(
        stripe_disbursement_id: Faker::Lorem.characters(9),
        user: users.sample,
        disbursed_at: Faker::Date.between(10.days.ago, 10.days.from_now)
        )
end

disbursements = Disbursement.all


# Create Payments


15.times do
    Payment.create!(
        carpool: carpools.sample,
        user: users.sample,
        paid_at: Faker::Date.between(10.days.ago, 10.days.from_now),
        stripe_id: Faker::Lorem.characters(9),
        disbursement: disbursements.sample,
        payment_amount: RandomData.random_seat_price
        )
end

payments = Payment.all




puts "Seed finished"
puts "#{User.count} users"
puts "#{Ride.count} rides"
puts "#{Carpool.count} carpools"
puts "#{Message.count} messages"
puts "#{Rating.count} ratings"
puts "#{Payment.count} payments"
puts "#{Disbursement.count} disbursements"



