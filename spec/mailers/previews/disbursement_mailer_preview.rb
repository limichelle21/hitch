# Preview all emails at http://localhost:3000/rails/mailers/disbursement_mailer
class DisbursementMailerPreview < ActionMailer::Preview
    
    
    def sample_mail_preview
        u = User.first
        DisbursementMailer.driver_disburse_email(u, u.rides, u.carpools)
    end

end
