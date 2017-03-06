class Payment < ActiveRecord::Base
    
    belongs_to :carpool
    belongs_to :disbursement
    belongs_to :user

    
    def save_stripe_token
    end
    
    def save_disbursement
        # when disbursement is made, save disbursement ID associated with this payment
    end

end



