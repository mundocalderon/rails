class CreateCategoriesEntries < ActiveRecord::Migration
  def up
    create_table :categories_entries, :id => false do |t|
      t.references :entry
      t.references :category
    end
    add_index :categories_entries, [:entry_id, :category_id]
    add_index :categories_entries, [:category_id, :entry_id]
  end

  def down
    drop_table :categories_entries
  end
end
