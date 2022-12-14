class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :listings
  has_many :bookings
  has_many :received_bookings, through: :listings, source: :bookings
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :username, :password, :email, presence: true
  validates :name, length: { minimum: 2 }
  validates :bio, length: { minimum: 10}
  validates :username, :email, uniqueness: true

end
