class Destination < ApplicationRecord
  validates :city, :country, :description, :image, presence: true
  validates :city, :country, length: { in: 2..100 }
  validates :description, length: { in: 3..300 }

  has_one_attached :image do |attachable|
      attachable.variant :thumb, resize_to_limit: [400,400]
  end
end