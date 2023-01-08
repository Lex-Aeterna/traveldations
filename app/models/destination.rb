class Destination < ApplicationRecord
  validates :city, :country, :description, presence: true
  validates :city, :country, length: { in: 2..100 }
  validates :description, length: { in: 3..300 }
end