class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  validates :start_date, presence: true
  validates :start_date, presence: true
end
