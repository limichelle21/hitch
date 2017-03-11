class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :carpools
    has_many :rides, through: :carpools
    has_many :messages
    has_many :payments
    has_many :disbursements
    has_many :ratings

    
    def average_rating
        # takes average of all ratings associated with a user
        user.ratings.collect / user.ratings.count
    end


    def avatar_url
        # retrieves a user's gravatar
    end
    

end
