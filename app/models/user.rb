class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



def calculate_ratings
    # takes average of all ratings associated with a user
end
    
def save_rating
    # Save rating integer from email response to a user's recor
end


def avatar_url
    # retrieves a user's gravatar
end
    

end
