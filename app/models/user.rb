class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

    has_many :carpools
    has_many :rides, through: :carpools
    has_many :messages
    has_many :payments
    has_many :disbursements
    has_many :ratings

    
    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
          end
    end
    
    
    def self.new_with_session(params, session)
        super.tap do |user|
          if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
            user.email = data["email"] if user.email.blank?
          end
        end
    end

    
    
    

    # takes average of all ratings associated with a user
    def calculate_rating
        if ratings.present?
            avg_rating = ratings.sum(:rating_value) / ratings.count
        else 
            avg_rating = 5
        end
        update_attribute(:average_rating, avg_rating)
        average_rating
    end


    def avatar_url(size)
        gravatar_id = Digest::MD5::hexdigest(self.email).downcase
        "https://s.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    end
    

end
