class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :species, presence: true
  validates :address, presence: true
end
