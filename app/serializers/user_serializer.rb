class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :average_rating
end
