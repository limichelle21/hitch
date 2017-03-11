require 'rails_helper'

RSpec.describe Payment, type: :model do
    it { should belong_to(:carpool) }
    it { should belong_to(:disbursement) }
    it { should belong_to(:user) }
    
    
    it { should validate_presence_of(:carpool) }
    it { should validate_presence_of(:disbursement) }
    it { should validate_presence_of(:user) }
    
end

