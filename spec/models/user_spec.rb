require 'rails_helper'


RSpec.describe User, type: :model do
    let(:user) { create(:user) }
    
    it { should have_many(:rides) }
    it { should have_many(:carpools) }
    it { should have_many(:messages) }
    it { should have_many(:payments) }
    it { should have_many(:disbursements) }
    it { should have_many(:ratings) }

    
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    
    

    describe "rating" do
        before do
            @ratings = [3, 4, 4, 5]
            @ratings.each do |r|
                create :rating, user: user, rating_value: r
            end
        end
        
        describe "#avg_rating" do
            it "calculates the average rating for a user" do
                raise user.ratings.inspect
                expect(user.average_rating).to eq(4)
            end
        end
        
    end
        
        
    describe "#avatar_url" do
        let(:known_user) { create(:user, email: "limichelle21@gmail.com") }
        it "returns the proper Gravatar url for a known email entity" do
            expected_gravatar = "https://s.gravatar.com/avatar/ae884b8dffedf0e15d3c9a661e7c66e5?s=48"
            expect(known_user.avatar_url(48)).to eq(expected_gravatar)
        end
    end
       
        
end


