class AddTitleToTextItems < ActiveRecord::Migration[6.1]
  def change
    add_column :text_items, :title, :string
  end
end
