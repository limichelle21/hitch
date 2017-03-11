class Payment < ActiveRecord::Base
    
    belongs_to :carpool
    belongs_to :disbursement
    belongs_to :user
    
    validates :carpool, presence: true
    validates :disbursement, presence: true
    validates :user, presence: true

    
    def save_stripe_token
    end
    
    def save_disbursement
        # when disbursement is made, save disbursement ID associated with this payment
    end

end



