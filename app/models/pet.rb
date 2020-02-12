class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  validates :name, presence: true
  validates :description, presence: true
  validates :species, presence: true
  validates :address, presence: true
  validates :price, presence: true

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:rating).round(2)
  end
end
