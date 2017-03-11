require 'rails_helper'

RSpec.describe Carpool, type: :model do
    
    it { should belong_to(:user) }
    it { should belong_to(:ride) }
    it { should have_many(:messages) }
    
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:ride) }
    
    
end
