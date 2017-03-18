class DisbursementMailer < ApplicationMailer
    default from: 'notifications@example.com'
    
    
    def driver_disburse_email(user, ride, carpool)
        @user = user
        @ride = @user.rides
        @carpool = @user.carpools
        mail(to: @user.email, subject: "Hitch - Your Disbursement Has been Processed")
    end
    
    
end
