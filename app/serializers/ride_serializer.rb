class RideSerializer < ActiveModel::Serializer
    attributes :id, :departure_location, :arrival_location, :seat_price, :total_seats, :available_seats, :reserved_seats, :notes, :ride_date, :departure_time, :total_ride_amount, :completed, :booked, :user_id, :created_at, :updated_at

    belongs_to :user
    has_many :carpools
    has_many :users, through: :carpools

end
