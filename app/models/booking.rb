class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  def accept
    Self.accepted = true
  end
end
