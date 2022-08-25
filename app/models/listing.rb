class Listing < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  pg_search_scope :search_listings,
    against: [ :name, :category, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
