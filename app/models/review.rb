class Review < ApplicationRecord
  belongs_to :booking
  validates :content, presence: true
  validates :rating, presence: true,
                     numericality: { only_integer: true },
                     inclusion: { in: [1, 2, 3, 4, 5] }
end
