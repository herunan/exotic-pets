class AddRatingAndReviewToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :rating, :integer
    add_column :bookings, :review, :text
  end
end
