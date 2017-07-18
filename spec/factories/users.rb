FactoryGirl.define do
  factory :user do
    sequence(:username, 1) { |n| "username#{n}" }
    sequence(:phone_number, 1) { |n| (111111111+n).to_s }
    sequence(:email, 1) { |n| "email#{n}@example.com" }
    sequence(:uid, 1) { |n| "000#{n}" }
    password              "password"
    password_confirmation "password"
    verified              true
    average_rating        "4"
    payment_card_token    "123456789"
    bank_account_token     "987654321"
    card_type             "Visa"
    last_4                "5678"
    confirmed_at          Time.zone.now

  end
end
