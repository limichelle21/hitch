include RandomData

FactoryGirl.define do
  factory :payment do
        carpool
        user
        paid_at { 5.days.ago }
        stripe_id "poijungyt"
        disbursement
        payment_amount RandomData.random_seat_price
  end
end
