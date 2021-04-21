class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :text_item_id
      t.index :text_item_id
      t.integer :rater_id
      t.index :rater_id

      t.float :rating

      t.timestamps
    end
  end
end
