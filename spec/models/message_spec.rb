require 'rails_helper'

RSpec.describe Message, type: :model do
    let(:user) { create(:user) }
    let(:carpool) { create(:carpool) }
    let(:message) { create(:message, user: user, carpool: carpool) }
    
    it { should belong_to(:user) }
    it { should belong_to(:carpool) }
    
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:carpool) }
    
    
    describe "#username" do
        it "should return the user's username" do
            expect(message.username).to eq(user.username)
        end
    end
    
end
