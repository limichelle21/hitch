require 'rails_helper'

RSpec.describe Disbursement, type: :model do
    
    it { should have_many(:payments) }
    it { should belong_to(:user) }
    
    it { should validate_presence_of(:user) }
    
end
