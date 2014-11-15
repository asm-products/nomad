class AddIndexToPlaces < ActiveRecord::Migration
  def change
    add_earthdistance_index :places
  end
end
