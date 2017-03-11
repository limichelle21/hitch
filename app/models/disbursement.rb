class Disbursement < ActiveRecord::Base
    
    has_many :payments
    belongs_to :user
    
    validates :user, presence: true
    
    
    def disburse
        # disburse amount to driver upon request
    end
    
    def email_driver
        # email driver indicating disbursement went through
    end
    
    
    # Cancellations/returns
    
    def return_payment
        # return payment amount to payment.user (person who paid)
    end
    
    def email_passenger
        # email passenger indicating return went through
    end
    
end
