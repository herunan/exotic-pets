class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :user, foreign_key: true
      t.references :pet, foreign_key: true
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
