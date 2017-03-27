require "rails_helper"

RSpec.describe CarpoolMailer, type: :mailer do

    let(:user) { create(:user) }
    let(:ride) { create(:ride) }
    let(:carpool) { create(:carpool) }
    let(:mail) { CarpoolMailer.book_ride_email(user, ride, carpool).deliver_now }
    
    
    describe 'book_ride_email' do
        it 'renders the subject' do
            expect(mail.subject).to eq('Hitch - New Passenger Added')
        end
        
        it 'renders the receiver email' do
            expect(mail.to).to eq([user.email])
        end
        
        it 'renders the sender email' do
            expect(mail.from).to eq(['notifications@example.com'])
        end
        
        it 'assigns @user' do
            expect(mail.body.encoded).to match(user)
        end
        
        it 'assigns @ride' do
            expect(mail.body.encoded).to match(ride)
        end
        
        it 'assigns @carpool' do
            expect(mail.body.encoded).to match(carpool)
        end
        
        it 'assigns @url' do
            expect(mail.body.encoded).to match('http://hitch.com/carpools/#{@carpool.id}/messages/new')
        end

        
    end

    
    
    
    describe 'confirm_ride_email' do
    end
    
    describe 'cancel_ride_email' do
    end
    
    
    
    
end
