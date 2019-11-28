class AddDocToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :doc, :string
  end
end
