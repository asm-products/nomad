class ChangeRatingToInt < ActiveRecord::Migration
  def change
    remove_column :reviews, :rating
    add_column :reviews, :rating, :integer
    add_index :reviews, :rating
  end
end
