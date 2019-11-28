class CreateEntriesSubcategories < ActiveRecord::Migration
  def up
    create_table :entries_subcategories, :id => false do |t|
      t.references :entry
      t.references :subcategory
    end
    add_index :entries_subcategories, [:entry_id, :subcategory_id]
    add_index :entries_subcategories, [:subcategory_id, :entry_id]
  end

  def down
    drop_table :entries_subcategories
  end
end
