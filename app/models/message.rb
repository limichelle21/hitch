class Message < ActiveRecord::Base
    
    belongs_to :carpool
    belongs_to :user
    
end
