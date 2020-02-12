class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :confirmed, default: false
      t.references :user, foreign_key: true
      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
