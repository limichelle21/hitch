FactoryGirl.define do
  factory :rating do
    rating_value "5"
    rating_comment "Great job!"
    user
  end
end
