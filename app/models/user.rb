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


    # takes average of all ratings associated with a user
    def average_rating
        raise ratings.inspect
        avg_rating = ratings.sum(:rating_value) / ratings.count
        update_attribute(:average_rating, avg_rating)
    end


    def avatar_url(size)
        gravatar_id = Digest::MD5::hexdigest(self.email).downcase
        "https://s.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    end
    

end
