class Carpool < ActiveRecord::Base
    
    belongs_to :ride
    belongs_to :user
    has_many :messages

    validates :user, presence: true
    validates :ride, presence: true
    
    
end
