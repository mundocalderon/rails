class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :url
      t.text :description
      t.references :entry_type

      t.timestamps
    end
  end
end
