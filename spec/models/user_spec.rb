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
    





end


