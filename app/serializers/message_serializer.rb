class MessageSerializer < ActiveModel::Serializer
    attributes :id, :sent_at, :content
    
    belongs_to :carpool_id
    belongs_to :user_id
end


