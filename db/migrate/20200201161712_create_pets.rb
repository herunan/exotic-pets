class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.integer :price
      t.text :description
      t.string :address
      t.integer :longitude
      t.integer :latitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
