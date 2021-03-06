class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :festivals
  has_many :bookings
  has_many :reviews, through: :bookings

  def host?
    self.role == "host"
  end

end

