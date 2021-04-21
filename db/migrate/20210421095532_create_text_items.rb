class CreateTextItems < ActiveRecord::Migration[6.1]
  def change
    create_table :text_items do |t|
      t.string :text
      t.boolean :published
      t.integer :writer_id
      t.integer :inspiration_id

      t.timestamps
    end
  end
end
