class Pet < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :name, presence: true
  validates :description, presence: true
  validates :species, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
