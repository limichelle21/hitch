FactoryGirl.define do
  factory :message do
      content "Just wanted to confirm pick up location"
      sent_at { 3.days.ago }
      user
      carpool
    
  end
end
