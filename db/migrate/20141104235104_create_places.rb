class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.float :lat
      t.float :lng
      t.string :name

      t.timestamps
    end
  end
end
