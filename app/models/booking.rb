class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :rating, numericality: { only_integer: true },
                     inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
