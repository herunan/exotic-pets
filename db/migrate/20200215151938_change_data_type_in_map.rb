class ChangeDataTypeInMap < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :latitude, :float
    change_column :pets, :longitude, :float
  end
end
