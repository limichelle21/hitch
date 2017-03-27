class CarpoolSerializer < ActiveModel::Serializer
    attributes :id, :rider_number, :total_payment
    
    belongs_to :ride_id
    belongs_to :user_id 
    has_many :messages
end

