class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :listings
  has_many :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :username, :password, :email, :bio, presence: true
  validates :name, length: { minimum: 2 }
  validates :bio, length: { minimum: 50}
  validates :username, :email, uniqueness: true
end
