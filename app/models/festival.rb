class Festival < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :bookings
  belongs_to :user
end
