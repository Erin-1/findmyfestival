class Booking < ApplicationRecord
  belongs_to :festival
  belongs_to :user
end
