class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :body
      t.decimal :rating, index: true
      t.belongs_to :place, index: true

      t.timestamps
    end
  end
end
