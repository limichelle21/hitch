class Message < ActiveRecord::Base
    
    belongs_to :carpool
    belongs_to :user
    
    validates :user, presence: true
    validates :carpool, presence: true

    
    def username
        self.user.username
    end
    
end
