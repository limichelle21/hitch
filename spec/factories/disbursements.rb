FactoryGirl.define do
  factory :disbursement do
      stripe_disbursement_id "fhjlsieu9"
      user
      disbursed_at { 4.days.ago }

  end
end
