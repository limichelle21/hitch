# Preview all emails at http://localhost:3000/rails/mailers/carpool_mailer
class CarpoolMailerPreview < ActionMailer::Preview

    def sample_mail_preview
        CarpoolMailer.book_ride_email(User.first, Ride.first, Carpool.first)
    end

    
end
