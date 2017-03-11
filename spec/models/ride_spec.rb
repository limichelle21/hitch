require 'rails_helper'

RSpec.describe Ride, type: :model do
    let(:ride) { create(:ride) }
    
    it { should belong_to(:user) }
    it { should have_many(:carpools) }
    it { should have_many(:users) }
    
    
    it { should validate_presence_of(:user) }
    
    
end
