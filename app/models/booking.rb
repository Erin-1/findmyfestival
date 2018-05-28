class Booking < ApplicationRecord
  belongs_to :festival
  belongs_to :user
  has_many :reviews
end
