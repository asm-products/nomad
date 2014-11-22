class AddPlaceidToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :placeid, :string
    add_index :places, :placeid
  end
end
