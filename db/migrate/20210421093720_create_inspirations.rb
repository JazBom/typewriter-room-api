class CreateInspirations < ActiveRecord::Migration[6.1]
  def change
    create_table :inspirations do |t|
      t.string :sentence
      t.string :sentenceOf
      t.string :imageUrl
      t.string :imageOf

      t.timestamps
    end
  end
end
